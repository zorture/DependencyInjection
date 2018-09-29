//
//  BaseInjectionSegue.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/29/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseInjectionSegue: UIStoryboardSegue {
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        //injectDependency(detail: <#T##Result#>)
    }
    
    override func perform() {
        let navController = source.navigationController
        navController?.pushViewController(destination, animated: true)
    }

    func injectDependency(detail: Result){
        
    }
}
