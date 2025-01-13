//
//  SkyBaseViewController.swift
//  MVVMCDemo
//
//  Created by mac on 2025/1/10.
//
import UIKit

protocol SkyBaseViewControllerProtocol: AnyObject {
    
    var viewModel: SkyBaseViewModel { get set }
    
}

class SkyBaseViewController: UIViewController {

    weak var coordinator: SkyBaseCoordinator?;
    
    var viewModel: SkyBaseViewModel;

    init(vm: SkyBaseViewModel) {
        self.viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(type(of: self)) dealloc");
    }
}
