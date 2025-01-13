//
//  SkyLastViewController.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/12.
//

import UIKit

class SkyLastViewController: SkyBaseViewController {

    var vm: SkyLastViewModel {
        return viewModel as! SkyLastViewModel;
    }
    
    var button: UIButton = UIButton(type: .system);
    var label: UILabel = UILabel();
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        if isMovingFromParent {
            self.vm.toPopOperate();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen;
        
        self.button.frame =  CGRect(x: 100, y: 100, width: 120.0, height: 40.0);
        self.button.setTitle("present", for: .normal);
        self.button.addTarget(self, action: #selector(presentEvent(_ :)), for: .touchUpInside);
        self.view.addSubview(self.button);
        
        self.label.frame = CGRect(x: 70, y: 200, width: 300, height: 40);
        self.label.textColor = .white;
        self.view.addSubview(self.label);
        
        self.bindViewModel();
        // Do any additional setup after loading the view.
    }
    
    @objc private func presentEvent(_ present: UIButton) -> Void {
        //模态出设置页面
        self.vm.toPresentConfigVcOperate(vc: self)
    }
    
    private func bindViewModel() -> Void {
        //获取值
        self.vm.fetchValue {
            [weak self]
            value in
            self?.title = value ?? "";
        };
        //获取配置数据 - present
        self.vm.dissmissClosure = {
            [weak self]
            value in
            self?.label.text = value;
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
