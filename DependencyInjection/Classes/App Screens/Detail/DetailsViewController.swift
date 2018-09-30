//
//  DetailsViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/27/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var collectionNameLabel: UILabel!
    @IBOutlet private weak var artistNameLbl: UILabel!
    @IBOutlet private weak var artistIdLbl: UILabel!
    @IBOutlet private weak var releaseDateLbl: UILabel!
    private var viewModel: DetailsViewModel?
    
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
        artistIdLbl.text = viewModel?.dataModel.data?.artistID
        releaseDateLbl.text = viewModel?.dataModel.data?.releaseDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? PreviewViewController
        destination?.injectDependency(withDependency: viewModel?.dataModel.data?.artistURL)
        print(segue.description)
    }

}

extension DetailsViewController: BaseViewModelPattern {
    func didReceiveData() {
        
    }
}

extension DetailsViewController: BaseInjectionPattern {
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.viewModel?.dataModel?.data = dependency as? Result
        return viewController as! T
    }
    
    func injectDependency<U>(withDependency dependency: U){
    }
}

