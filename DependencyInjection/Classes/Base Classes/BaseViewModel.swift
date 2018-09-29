//
//  BaseViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseViewModel<T>  {
    let delegate: BaseViewModelPattern!
    let dataModel: T?
    init(delegate: BaseViewModelPattern, dataModel: T) {
        self.delegate = delegate
        self.dataModel = dataModel
    }

}



