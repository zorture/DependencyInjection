//
//  PreviewViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/30/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class PreviewViewModel: BaseViewModel<PreviewDataModel> {

    func fetchPost(searchQuery: String) {
        let executer = TaskExecuter()
        let urlString = searchQuery
        do {
            _ = try executer.createRequestWith(urlString: urlString)
        } catch  ExecutionExceptions.InvalidURLString {
            print("URL Sring is not correct")
        } catch  ExecutionExceptions.InvalidURL {
            print("URL is not valid")
        } catch {
            print(error.localizedDescription)
        }
        
        executer.response(successHandler: { [weak self] (data) in
            let image = UIImage.init(data: data)
            self?.dataModel.image = image
            DispatchQueue.main.async {
                self?.delegate?.didReceiveData()
            }
        }) { (error) in
            print(error.localizedDescription)
        }

    }
}
