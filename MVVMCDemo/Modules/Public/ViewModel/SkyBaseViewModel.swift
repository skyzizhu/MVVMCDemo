//
//  BaseViewModel.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

typealias SkyBasePopClosure = ((Any?) -> Void);
typealias SkyBaseVoidClosure = (() -> Void);

class SkyBaseViewModel {
    
    var data: Any = AnyObject.self;
    
    var dataCount: Int {
        get {
            if let data = self.data as? [Any] {
                return data.count;
            }
            return 0;
        }
    }
    
    ///获取数据
    func fetchDatas(completion: @escaping () -> Void) {
        
    }
    ///pop时执行的闭包
    var popClosure: SkyBasePopClosure?;
    ///上一页pop后接收的
    var callBackFetchValue: SkyBasePopClosure?;
}
