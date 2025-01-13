//
//  UserListViewModel.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import Foundation
import UIKit


class SkyUserListViewModel: SkyBaseViewModel {
    
    var value: String?;
    
    init(value: String? = nil) {
        self.value = value
    }
    
    ///获取导航
    func fetchNaviTitle(completion: ((String?) -> Void)?) -> Void {
        completion?(self.value);
    }
    
    ///数据获取，模拟网络数据
    override func fetchDatas(completion: @escaping () -> Void) {
        //数据
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            self.data = [
                User(id: 1, name: "Alice", age: 25, gender: "Female"),
                User(id: 2, name: "Bob", age: 30, gender: "Male"),
                User(id: 3, name: "Charlie", age: 28, gender: "Male")
            ]
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
//    ///跳转详情
//    var onShowDetail: ((Int, @escaping (Any?) -> Void) -> Void)?
//
//    var res: String?
//    ///更新结果
//    var updateResult: ((String) -> Void)?;
//    
//    ///点击cell跳转
//    func didSelectUser(at index: Int) {
//        if let data = self.data as? [User] {
//            let user = data[index]
//            self.onShowDetail?(user.id,{
//                [weak self]
//                res in
//                self?.res = res as? String;
//                self?.updateResult?(res as? String ?? "");
//            })
//        }
//    }
    
    
    //监听
    private var observerDidResult: ((Notification) -> Void)?;
    func addObserverEnterBackgroundNotification(didResult:@escaping ((Notification) -> Void)) -> Void {
        self.observerDidResult = didResult;
        NotificationCenter.default.addObserver(self,selector: #selector(appDidEnterBackground(_ :)),name:UIApplication.didEnterBackgroundNotification,object: nil)
    }
    @objc private func appDidEnterBackground(_ noti: Notification) -> Void {
        self.observerDidResult?(noti);
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil);
    }

    
    var toDetailHandle: ((_ articleID: Int, _ pop: SkyBasePopClosure?) -> Void)?;
    func toDetailPage(index: Int) -> Void {
        if let data = self.data as? [User] {
            let user = data[index]
            self.toDetailHandle?(user.id, self.callBackFetchValue);
        }
    }
    
    var backClosure: (() -> Void)?;
    func back(value: Any?) -> Void {
        self.popClosure?(value);
        self.backClosure?();
    }
}

