//
//  BaseCoordinator.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit

protocol SkyBaseCoordinator: AnyObject {
    var childCoordinators: [SkyBaseCoordinator] { get set }
    var navigationController: UINavigationController? { get set }
    
    ///启动
    func start()
    func childDidFinish(_ child: SkyBaseCoordinator?)
}

extension SkyBaseCoordinator {
    ///完成后
    func childDidFinish(_ child: SkyBaseCoordinator?) {
        if let child = child {
            childCoordinators.removeAll { $0 === child }
        }
    }
    /// pop
    func toPop(animated: Bool = true) -> Void {
        self.navigationController?.popViewController(animated: animated);
    }
}
