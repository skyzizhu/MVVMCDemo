//
//  SkyHomeViewModel.swift
//  MVVMCDemo
//
//  Created by mac on 2025/1/10.
//

class SkyHomeViewModel: SkyBaseViewModel {
    
    ///回调
    var toListClosure: ((String?, _ back: SkyBasePopClosure?) -> Void)?;
    func toUserList(naviTitle: String?) -> Void {
        self.toListClosure?(naviTitle, self.callBackFetchValue);
    }
}
