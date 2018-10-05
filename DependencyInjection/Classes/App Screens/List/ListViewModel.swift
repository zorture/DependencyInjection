//
//  ListViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class ListViewModel: BaseViewModel<ListDataModel> {

    func fetchPost(searchQuery: String) {
        let executer = TaskExecuter()
        let urlString = searchQuery
        
        do {
            try executer.fetchDecodableRequest(urlString: urlString, successHandler: {[weak self]  (model: List) in
                self?.dataModel?.data = model.feed.results
                DispatchQueue.main.async {
                    self?.delegate?.didReceiveData()
                }
            }, failureHandler: { (error) in
                print(error.localizedDescription)
            })
        }catch  ExecutionExceptions.InvalidURLString {
            print("URL Sring is not correct")
        } catch  ExecutionExceptions.InvalidURL {
            print("URL is not valid")
        } catch {
            print(error.localizedDescription)
        }

    }

}
