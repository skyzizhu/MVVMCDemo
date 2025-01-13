//
//  SkyLastCoordinator.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/12.
//

import UIKit

class SkyLastCoordinator: SkyBaseCoordinator {
    var childCoordinators: [any SkyBaseCoordinator] = [];
    
    var navigationController: UINavigationController?
    
    var endClosure: SkyBasePopClosure?;
    
    var str: String?;
    
    init(navigationController: UINavigationController? = nil, endClosure: SkyBasePopClosure? = nil, str: String? = nil) {
        self.navigationController = navigationController
        self.endClosure = endClosure
        self.str = str
    }
    
    func start() {
        let lastVm = SkyLastViewModel();
        lastVm.popClosure = endClosure;
        lastVm.pushValue = str;
        lastVm.didPresentConfigHandle = {
            vc in
            self.presentConfigVc(vc: vc);
        }
        let lastVc = SkyLastViewController(vm: lastVm);
        self.navigationController?.pushViewController(lastVc, animated: true);
    }
    private func presentConfigVc(vc: UIViewController?) -> Void {
        let presentVc: SkyPresentViewController = SkyPresentViewController();
        if let controller = vc as? SkyLastViewController {
            //给配置页面设置代理
            presentVc.delegate = controller.vm;
        }
        vc?.present(presentVc, animated: true);
    }
}
