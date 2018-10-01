//
//  BaseDataModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseDataModel<T> {
    var modelID: Int? = nil
    var modelName: String?
    var data: T?
}
