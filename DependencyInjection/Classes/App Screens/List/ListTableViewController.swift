//
//  ListTableViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/25/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    private let viewModel: ListViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        viewModel = ListViewModel(dataModel: ListDataModel())
        super.init(coder: aDecoder)
        viewModel?.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchPost(searchQuery: "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/50/explicit.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.dataModel!.data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        if let data = viewModel?.dataModel?.data![indexPath.row] {
            cell.textLabel?.text = data.artistName
            cell.detailTextLabel?.text = data.artistID
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel?.dataModel?.data![indexPath.row]
        let detailVC = DetailsViewController.segueFromStoryboard(withDependency: data)
        let navController = self.navigationController
        navController?.pushViewController(detailVC, animated: true)
    }
}

extension ListTableViewController: BaseViewModelPattern {
    
    func didReceiveData() {
        tableView.reloadData()
    }
}

extension ListTableViewController: BaseInjectionPattern {
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListTableViewController") as! ListTableViewController
        viewController.viewModel?.dataModel?.data = dependency as? [Result]
        return viewController as! T
    }
    
    func injectDependency<U>(withDependency dependency: U){
    }
}
