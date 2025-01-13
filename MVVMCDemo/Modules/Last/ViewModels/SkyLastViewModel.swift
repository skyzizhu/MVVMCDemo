//
//  SkyLastViewModel.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/12.
//

import UIKit

class SkyLastViewModel: SkyBaseViewModel, SkyPresentViewControllerProtocol {
    
    // MARK: - Present view controller delegate
    func dismissPresentViewController(value: String) {
        self.dissmissClosure?(value);
    }
    /// 设置（更新）配置信息
    var dissmissClosure: ((_ value: String) -> Void)?;
    
    deinit {
        print("SkyLastViewModel dealloc");
    }
    /// push 传值
    var pushValue: String?;
    
    func fetchValue(_ update: ((_ value: String?) -> Void)?) -> Void {
        update?(self.pushValue);
    }
    
    func toPopOperate() -> Void {
        self.popClosure?("随便传一个值吧！");
    }
    
    var didPresentConfigHandle: ((_ vc: UIViewController?) -> Void)?;
    func toPresentConfigVcOperate(vc: UIViewController?) -> Void {
        self.didPresentConfigHandle?(vc);
    }
}
