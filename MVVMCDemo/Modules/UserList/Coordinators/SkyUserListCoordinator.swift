//
//  SkyUserListCoordinator.swift
//  MVVMCDemo
//
//  Created by mac on 2025/1/10.
//

import UIKit

class SkyUserListCoordinator: SkyBaseCoordinator {
    
    var childCoordinators: [SkyBaseCoordinator] = []
    
    var navigationController: UINavigationController?
    
    private var naviTitle: String?;
    
    private var backClosure: SkyBasePopClosure?;
    
    init(navigationController: UINavigationController? = nil, naviTitle: String? = nil, end: ((Any?) -> Void)? = nil) {
        self.navigationController = navigationController
        self.naviTitle = naviTitle
        self.backClosure = end;
    }
    
    func start() {
        let viewModel = SkyUserListViewModel(value: self.naviTitle);
        //去详情
        viewModel.toDetailHandle = {
            `id`, popClosure in
            self.toDetail(articleID: id, afterPop: popClosure);
        }
        //回首页
        viewModel.popClosure = self.backClosure;
        viewModel.backClosure = {
            self.toPop(animated: true);
        }
        let listVc = UserListViewController(vm: viewModel)
        listVc.coordinator = self;
        navigationController?.pushViewController(listVc, animated: true)
    }
    
    func toDetail(articleID: Int, afterPop: ((Any?) -> Void)? = nil) -> Void {
        let detailCoordinator = SkyDetailCoordinator(navigationController: navigationController, articleID: articleID, completion: afterPop);
        childCoordinators.append(detailCoordinator);
        detailCoordinator.start();
    }
    
}
