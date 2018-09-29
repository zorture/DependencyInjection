//
//  BaseViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseViewModel  {
    let delegate: BaseViewModelPatern!
    
    init(delegate: BaseViewModelPatern) {
        self.delegate = delegate
    }

}



