//
//  DetailViewModel.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

class DetailViewModel: SkyBaseViewModel {
    
    var articleID: Int;
    
    init(articleID: Int) {
        self.articleID = articleID
    }
    
    
    var toPop: (() -> Void)?;
    func pop(val: Any? = nil) -> Void {
        //执行pop时候的闭包操作
        self.popClosure?(val);
        //pop
        self.toPop?();
    }
    
    ///去last页面
    var toLastHandle: ((_ str: String?, _ callBack: SkyBasePopClosure?) -> Void)?;
    func toLastPage(val: String?) -> Void {
        self.toLastHandle?(val,self.callBackFetchValue);
    }
}
