//
//  ListTableViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/25/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    fileprivate var viewModel: ListViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel = ListViewModel(delegate: self, dataModel: ListDataModel())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchPost(searchQuery: "")
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
