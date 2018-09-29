//
//  DetailsViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/27/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    
    fileprivate var viewModel: DetailsViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = DetailsViewModel(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.viewModel = DetailsViewModel(delegate: self)
        // Do any additional setup after loading the view.
        
        //let imageURL = URL(string: (viewModel?.dataModel.details?.artistURL)!)
        //imageView.image = try UIImage(data: Data(contentsOf: imageURL!))
        artistNameLbl.text = viewModel?.dataModel.details?.artistName
        collectionNameLabel.text = viewModel?.dataModel.details?.collectionName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: ViewModelDelegates {
    func didReceiveData() {
        
    }
}

extension DetailsViewController: BaseSegue {
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.viewModel?.dataModel.details = dependency as? Result
        return viewController as! T
    }
    
}

