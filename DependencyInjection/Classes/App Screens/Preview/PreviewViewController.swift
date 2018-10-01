//
//  PreviewViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/30/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    private let viewModel: PreviewViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = PreviewViewModel(dataModel: PreviewDataModel())
        super.init(coder: aDecoder)
        self.viewModel?.delegate = self
        //self.viewModel = PreviewViewModel(delegate: self, dataModel: PreviewDataModel())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchPost(searchQuery: viewModel?.dataModel.data ?? "")
        // Do any additional setup after loading the view.
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

extension PreviewViewController: BaseViewModelPattern{
    func didReceiveData() {
        imageView.image = viewModel?.dataModel.image
    }
}

extension PreviewViewController: BaseInjectionPattern {
    static func segueFromStoryboard<T, U>(withDependency dependency: U) -> T where T : UIViewController, U : Decodable {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
        return viewController as! T
    }
    
    func injectDependency<U>(withDependency dependency: U){
        viewModel?.dataModel.data = dependency as? String
    }
}
