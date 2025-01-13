//
//  SkyPresentViewController.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/13.
//

import UIKit

protocol SkyPresentViewControllerProtocol: AnyObject {
    func dismissPresentViewController(value: String);
}

class SkyPresentViewController: UIViewController {
    
    weak var delegate: SkyPresentViewControllerProtocol?;
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        if isBeingDismissed {
            self.delegate?.dismissPresentViewController(value: "present to value HEIHEIHEI!");
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red;
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("SkyPresentViewController dealloc");
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
