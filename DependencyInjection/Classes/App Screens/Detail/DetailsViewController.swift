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
        self.viewModel = DetailsViewModel(delegate: self, dataModel: DetailsDataModel())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let imageURL = URL(string: (viewModel?.dataModel.details?.artistURL)!)
        //imageView.image = try UIImage(data: Data(contentsOf: imageURL!))
        artistNameLbl.text = viewModel?.dataModel?.data?.artistName
        collectionNameLabel.text = viewModel?.dataModel?.data?.collectionName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension DetailsViewController: BaseViewModelPattern {
    func didReceiveData() {
        
    }
}

extension DetailsViewController: BaseInjectionPatern {
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.viewModel?.dataModel?.data = dependency as? Result
        return viewController as! T
    }
    
}

