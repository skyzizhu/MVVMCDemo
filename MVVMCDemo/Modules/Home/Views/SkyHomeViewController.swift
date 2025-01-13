//
//  SkyHomeViewController.swift
//  MVVMCDemo
//
//  Created by mac on 2025/1/10.
//

import UIKit

class SkyHomeViewController: SkyBaseViewController {

    var vm: SkyHomeViewModel {
        return viewModel as! SkyHomeViewModel;
    }
    
    
    var button: UIButton = UIButton(type: .custom);
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green;
        self.title = "Home";
        
        self.button.frame = CGRect(x: 100.0, y: 100.0, width: 160.0, height: 40.0);
        self.button.setTitle("点击-导航名称！", for: .normal);
        self.button.backgroundColor = .red;
        self.button.addTarget(self, action: #selector(pushEvent), for: .touchUpInside);
        self.view.addSubview(self.button);
        
        self.bindViewModel();
        
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() -> Void {
        ///接收回调数据
        vm.callBackFetchValue = {
            [weak self]
            value in
            if let str = value as? String {
                self?.button.setTitle(str, for: .normal);
            }
        };
    }
    
    @objc private func pushEvent() -> Void {
        self.vm.toUserList(naviTitle: "导航名称123！");
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
