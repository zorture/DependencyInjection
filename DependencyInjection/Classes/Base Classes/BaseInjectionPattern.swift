//
//  BaseInjectionPattern.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/29/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

protocol BaseInjectionPattern {
    // Static method to reture View controller from Storyboard and initialize complety with dependency
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable
    
    // Method to inject dependency. To be used when segue is done from storyboard
    func injectDependency<U>(withDependency dependency: U)
}
