//
//  BaseViewController.swift
//  DependencyInjection
//
//  Created by Kanwar Zorawar Singh Rana on 9/29/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
