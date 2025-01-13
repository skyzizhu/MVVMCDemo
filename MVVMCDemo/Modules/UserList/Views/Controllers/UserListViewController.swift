//
//  UserListViewController.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit

class UserListViewController: SkyBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var vm: SkyUserListViewModel {
        return viewModel as! SkyUserListViewModel
    }
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.bindViewModel();
    }
    
    //绑定vm及监听数据刷新UI
    private func bindViewModel() {
        //更新导航title
        vm.fetchNaviTitle {
            [weak self]
            naviTitle in
            self?.navigationItem.title = naviTitle;
        }
        //获取列表数据
        vm.fetchDatas {
            [weak self] in
            self?.tableView.reloadData()
        }
        //获取详情返回结果
        self.vm.callBackFetchValue = {
            [weak self]
            value in
            print(value ?? "");
            self?.title = value as? String;
        }
        //监听退到后台
        self.vm.addObserverEnterBackgroundNotification { noti in
            print(noti.name);
        }
        //其他数据...
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "User List"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataCount;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        //通过vm中的数据分配UI数据
        if let datas = vm.data as? [User] {
            let user = datas[indexPath.row];
            cell.configure(with: user)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            //返回
            self.vm.back(value: "上一页传值!")
        } else {
            ///跳转到详情
            vm.toDetailPage(index: indexPath.row);
        }
    }
}

