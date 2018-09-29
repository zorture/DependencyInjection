//
//  BaseInjectionPattern.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/29/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

protocol BaseInjectionPattern {
   static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable
}
