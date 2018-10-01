//
//  BaseViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseViewModel<T>  {
    var delegate: BaseViewModelPattern?
    let dataModel: T!
    
    init(dataModel: T) {
        self.dataModel = dataModel
    }
    
    convenience init(delegate: BaseViewModelPattern, dataModel: T) {
        self.init(dataModel: dataModel)
        self.delegate = delegate
    }

}



