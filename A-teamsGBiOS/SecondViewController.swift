//
//  SecondViewController.swift
//  A-teamsGBiOS
//
//  Created by Александр Сидоров on 05.10.17.
//  Copyright © 2017 Александр Сидоров. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viewSVC: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.viewSVC.layer.cornerRadius = 8.0
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
