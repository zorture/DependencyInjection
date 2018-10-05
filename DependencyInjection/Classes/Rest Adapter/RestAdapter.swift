//
//  RestAdapter.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/25/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class RestAdapter {
    
    static let shared = RestAdapter()
    
    fileprivate let session = URLSession.shared
    fileprivate let queue = OperationQueue.init()
    
    init() {
        queue.maxConcurrentOperationCount = 5
    }
}

enum ExecutionExceptions: Error {
    case InvalidURLString
    case InvalidURL
}

enum Response<T> {
    case Success(T)
    case Failure(Error)
}

typealias TaskSuccessCompletion = (_ response: Data) -> Void
typealias TaskFailureCompletion = (_ error: Error) -> Void

class TaskExecuter {
    
    //typealias GenericData = T?
    //private var completionHandler: TaskCompletionCompletion?

    private var successHandler: TaskSuccessCompletion?
    private var failureHandler: TaskFailureCompletion?
    private let restAdapter = RestAdapter.shared
    
    func fetchDecodableRequest<T: Decodable>(urlString: String, successHandler: @escaping (T) -> (), failureHandler: @escaping (Error) -> ()) throws {
        
        // Set String
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { throw  ExecutionExceptions.InvalidURLString }
        
        // Set URL
        guard let url = URL.init(string: urlString) else { throw ExecutionExceptions.InvalidURL }
        
        // Execute the data Task
        let task = restAdapter.session.dataTask(with: url) { (data, response, error) in
            //self.processResponse(data: data, response: response, error: error)
            guard let data = data else {
                guard let error = error else {
                    return
                }
                failureHandler(error)

                return
            }
            self.processDecodable(type: T.self, data: data, completion: { (model: T) in
                successHandler(model)
            })
        }
        
        // Add task to operation Q
        let taskOperation = TaskOperation.init(task: task)
        restAdapter.queue.addOperation(taskOperation)
    }
    
    func fetchRequest(urlString: String, successHandler: @escaping (Data) -> (), failureHandler: @escaping (Error) -> ()) throws {
        
        // Set String
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { throw  ExecutionExceptions.InvalidURLString }
        
        // Set URL
        guard let url = URL.init(string: urlString) else { throw ExecutionExceptions.InvalidURL }
        
        // Execute the data Task
        let task = restAdapter.session.dataTask(with: url) { (data, response, error) in
            //self.processResponse(data: data, response: response, error: error)
            guard let data = data else {
                guard let error = error else {
                    return
                }
                failureHandler(error)
                
                return
            }
                successHandler(data)
        }
        
        // Add task to operation Q
        let taskOperation = TaskOperation.init(task: task)
        restAdapter.queue.addOperation(taskOperation)
    }
    
   private func processDecodable<T: Decodable>(type: T.Type, data: Data, completion: @escaping (T) -> ()) {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(model)
            }
        } catch {
            print(error)
        }
    }
}

class TaskOperation: Operation {
    let task: URLSessionTask
    
    init(task: URLSessionTask) {
        self.task = task
        task.resume()
    }
}
