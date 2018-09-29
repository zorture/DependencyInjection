//
//  ListViewModel.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/26/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class ListViewModel: BaseViewModel {
    
    let dataModel = ListDataModel()
    
    override init(delegate: ViewModelDelegates) {
        super.init(delegate: delegate)
    }

    func fetchPost(searchQuery: String) {
        let executer = TaskExecuter()
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/50/explicit.json"
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
            do {
                let list: List = try JSONDecoder().decode(List.self, from: data)
                self?.dataModel.data = list.feed.results
                DispatchQueue.main.async {
                    self?.delegate?.didReceiveData()
                }
            } catch {
                print(error)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }

}
