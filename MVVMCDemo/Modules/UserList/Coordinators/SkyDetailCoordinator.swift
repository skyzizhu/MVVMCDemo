//
//  DetailCoordinator.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit


class SkyDetailCoordinator: SkyBaseCoordinator {
    
    
    var childCoordinators: [SkyBaseCoordinator] = []
    
    var navigationController: UINavigationController?
    
    private var completion: ((Any?) -> Void)?;
    
    private var articleID: Int;
    init(navigationController: UINavigationController?, articleID: Int, completion: ((Any?) -> Void)?) {
        self.navigationController = navigationController;
        self.articleID = articleID
        self.completion = completion;
    }
    
    
    func start() {
        let viewModel = DetailViewModel(articleID: articleID);
        viewModel.popClosure = self.completion;
        viewModel.toPop = {
            self.toPop(animated: true);
        }
        
        //last
        viewModel.toLastHandle = {
            str, callback in
            self.pushLastPage(str: str, callBack: callback);
        }
        let detailViewController = DetailViewController(vm: viewModel);
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func pushLastPage(str: String?,callBack: SkyBasePopClosure? = nil) -> Void {
        let lastCoordinator = SkyLastCoordinator(navigationController: self.navigationController, endClosure: callBack, str: str);
        self.childCoordinators.append(lastCoordinator);
        lastCoordinator.start();
    }
    
    
    /*
     
    private var articleID: Int;
    private var completion: ((Any?) -> Void)?;
    
    ///初始化详情 Coordinator
    init(navigationController: UINavigationController?, articleID: Int, completion: ((Any?) -> Void)?) {
        self.articleID = articleID
        self.completion = completion;
        //
        super.init();
        self.navigationController = navigationController;
    }
    
    override func start() {
        let viewModel = DetailViewModel(articleID: articleID);
        //点击详情中的return按钮
        viewModel.toPop = {
            self.end();
        }
        //赋值pop后的闭包，用于传值
        viewModel.popClosure = self.completion;
        
        let detailViewController = DetailViewController(vm: viewModel);
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func presentConfigVc() -> Void {
        let presentVc = UIViewController();
        presentVc.view.backgroundColor = .red;
        self.navigationController?.present(presentVc, animated: true);
    }
    */
}
