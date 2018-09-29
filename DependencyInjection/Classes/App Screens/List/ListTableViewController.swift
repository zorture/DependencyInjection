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

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel(delegate: self)
        viewModel?.fetchPost(searchQuery: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.dataModel.data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        if let data = viewModel?.dataModel.data![indexPath.row] {
            cell.textLabel?.text = data.artistName
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel?.dataModel.data![indexPath.row]
        let detailVC = DetailsViewController.segueFromStoryboard(withDependency: data)
        let navController = self.navigationController
        navController?.pushViewController(detailVC, animated: true)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let detailsVC = segue.destination as? DetailsViewController
        //let data = viewModel?.dataModel.results![0] as! Result
        //detailsVC?.viewModel?.dataModel.details = data
        print(segue)
    }

}

extension ListTableViewController: ViewModelDelegates {
    
    func didReceiveData() {
        tableView.reloadData()
    }
}
