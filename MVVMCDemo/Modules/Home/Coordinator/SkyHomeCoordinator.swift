//
//  SkyHomeCoordinator.swift
//  MVVMCDemo
//
//  Created by mac on 2025/1/10.
//

import UIKit

class SkyHomeCoordinator: SkyBaseCoordinator {
    var childCoordinators: [SkyBaseCoordinator] = [];
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SkyHomeViewModel()
        viewModel.toListClosure = {
            naviTitle, backClosure  in
            self.pushList(value: naviTitle, endClosure: backClosure);
        }
        let homeVc = SkyHomeViewController(vm: viewModel);
        homeVc.coordinator = self;
        navigationController?.pushViewController(homeVc, animated: false)
    }
    
    private func pushList(value: String?,endClosure: ((Any?) -> Void)? = nil) -> Void {
        let userListCoordinator = SkyUserListCoordinator(navigationController: self.navigationController,naviTitle: value,end: endClosure);
        childCoordinators.append(userListCoordinator)
        userListCoordinator.start()
    }
}
