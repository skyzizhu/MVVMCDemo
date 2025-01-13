//
//  AppCoordinator.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit


class SkyAppCoordinator: SkyBaseCoordinator {
    var childCoordinators: [SkyBaseCoordinator] = []
    var navigationController: UINavigationController?
    
    private var window: UIWindow;
    
    init(window: UIWindow) {
        self.window = window;
    }
    
    func start() {
        // 启动主界面协调器
        self.navigationController = UINavigationController()
        //home vc
        let homeCoordinator = SkyHomeCoordinator(navigationController: self.navigationController!);
        childCoordinators.append(homeCoordinator);
        homeCoordinator.start();
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

//class AppCoordinator: BaseCoordinator {
//    private let window: UIWindow
//
//    init(window: UIWindow) {
//        self.window = window
//    }
//    
//
//    override func start() {
//        let viewModel = UserListViewModel()
//        let userListController = UserListViewController(viewModel: viewModel)
//
//        viewModel.onShowDetail = { [weak self] articleID, completion in
//            self?.showDetail(for: articleID, completion: completion)
//        }
//
//        navigationController = UINavigationController(rootViewController: userListController)
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
//    }
//    
//    private func showDetail(for articleID: Int, completion: @escaping (Any?) -> Void) {
//        
//        let detailCoordinator = DetailCoordinator(navigationController: self.navigationController, articleID: articleID,completion: completion);
//        detailCoordinator.start();
////        let viewModel = DetailViewModel(articleID: articleID);
////        viewModel.toPop = {
////            [weak self] in
////            self?.end();
////        }
////        
////        let detailViewController = DetailViewController(vm: viewModel);
////        detailViewController.onResult = { result in
////            completion(result)
////        }
////        navigationController?.pushViewController(detailViewController, animated: true)
//    }
//}
