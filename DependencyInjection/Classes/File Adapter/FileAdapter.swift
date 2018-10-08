//
//  FileAdapter.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 10/8/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class FileAdapter {
    class func decodeJsonData<T: Decodable>(oftype: T.Type, fromFile file: String) -> T?{
        
        let path = Bundle.main.path(forResource: file, ofType: ".json")
        do {
             let fileContent = try String.init(contentsOfFile: path ?? "", encoding: .utf8)
            if let jsonData = fileContent.data(using: .utf8)
            {
                //And here you get the Car object back
                let model = try JSONDecoder().decode(T.self, from: jsonData)
                return model as T
            }
        
        } catch  {
            print("error file handling")
        }
        return .none
    }
}
