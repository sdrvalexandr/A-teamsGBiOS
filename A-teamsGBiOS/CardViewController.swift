//
//  CardViewController.swift
//  A-teamsGBiOS
//
//  Created by Александр Сидоров on 06.10.17.
//  Copyright © 2017 Александр Сидоров. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CardViewController: UIViewController {
    //view
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var viewFive: UIView!
    //cardOne
    @IBOutlet weak var textFieldCardOne: UITextField!
    @IBOutlet weak var labelCardOne: UILabel!
    @IBAction func searchButtonCardOne(_ sender: UIButton) {
        searchPost()
    }
    //cardTwo
    @IBOutlet weak var textFieldCardTwo: UITextField!
    @IBOutlet weak var labelCardTwo: UILabel!
    @IBAction func searchButtonCardTwo(_ sender: UIButton) {
        searchComment()
    }
    //cardFour
    
    @IBOutlet weak var imageFourCard: UIImageView!
    //cardFive
    @IBAction func randomButton(_ sender: UIButton) {
        randomPost()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           //views
        self.viewOne.layer.cornerRadius = 8.0
        self.viewTwo.layer.cornerRadius = 8.0
        self.viewThree.layer.cornerRadius = 8.0
        self.viewFour.layer.cornerRadius = 8.0
        self.viewFive.layer.cornerRadius = 8.0
          //cardThree
        searchUser()
          //cardFour
        userImage()
          //cardFive
        randomPost()
    }
    
    func searchPost() {
        
        let iDcardOne = textFieldCardOne.text!
        if Int(iDcardOne)! >= 101 {
            alertCtrl( massage: "error! maximum number of posts are 100")
        }
        let url = "https://jsonplaceholder.typicode.com/posts/" + iDcardOne
        Alamofire.request(url).validate().responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    self.labelCardOne.text = json["title"].stringValue
                case .failure(let error):
                    print(error)
                }
        }
    }
   
    func searchComment() {
        let iDcardOne = textFieldCardTwo.text!
        if Int(iDcardOne)! >= 501 {
            alertCtrl( massage: "error! maximum number of posts are 500")
        }
        let url = "https://jsonplaceholder.typicode.com/comments/" + iDcardOne
        Alamofire.request(url).validate().responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    self.labelCardTwo.text = json["body"].stringValue
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func searchUser() {
        for index in 1...5 {
        let url = "https://jsonplaceholder.typicode.com/users/" + String(index)
        Alamofire.request(url).validate().responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                   // print(json)
                    let label = self.view.viewWithTag(1000) as! UILabel
                    let user = json["name"].stringValue
                    label.text! = label.text! + user + ("\n")
                case .failure(let error):
                    print(error)
                }
        }
      }
    }
    
    func userImage() {
        let url = "https://jsonplaceholder.typicode.com/photos/3"
        Alamofire.request(url).validate().responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                    // print(json)
                    let image = json["thumbnailUrl"].stringValue
                    //let image = "https://placehold.it/150/24f355"
                    print(image)
                    
                    let url = URL(string: image)
                    let data = try? Data(contentsOf: url!)
                    self.imageFourCard.image = UIImage(data: data!)!
                    
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func randomPost() {
        let random = String(arc4random_uniform(199)+1)
        print(random)
        let url = "https://jsonplaceholder.typicode.com/posts/" + random
        Alamofire.request(url).validate().responseJSON
            {
                response in
                
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    self.labelCardOne.text = json["title"].stringValue
                    let label = self.view.viewWithTag(5000) as! UILabel
                    label.text! = json["title"].stringValue
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func alertCtrl( massage: String) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }

    
}
