//
//  BaseViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

protocol ViewModelDelegates {
    func didReceiveData()
}

class BaseViewModel  {
    let delegate: ViewModelDelegates!
    
    init(delegate: ViewModelDelegates) {
        self.delegate = delegate
    }

}



