//
//  DetailViewController.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit

class DetailViewController: SkyBaseViewController {
    
    var vm: DetailViewModel {
        return viewModel as! DetailViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.bindViewModel();
    }
    
    private func bindViewModel() -> Void {
        self.vm.callBackFetchValue = {
            [weak self]
            str in
            if let val = str as? String {
                self?.title = val;
            }
        }
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Detail"

        let label = UILabel()
        label.text = "Article ID: \(self.vm.articleID)"
        label.textAlignment = .center

        let button = UIButton(type: .system)
        button.setTitle("Return Result", for: .normal)
        button.addTarget(self, action: #selector(returnResult), for: .touchUpInside)
        
        let button_1 = UIButton(type: .system)
        button_1.setTitle("Return Result", for: .normal)
        button_1.addTarget(self, action: #selector(presentEvent), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [label, button,button_1])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func returnResult() {
        ///点击返回，pop并传值给上个页面
        let val = "This is the \(self.vm.articleID)";
        self.vm.pop(val: val);
    }
    
    @objc private func presentEvent() {
        let pushVal = "push value is \(self.vm.articleID)";
        self.vm.toLastPage(val: pushVal);
    }
}

