//
//  ViewController.swift
//  testAlamofire
//
//  Created by Hao on 10/22/17.
//  Copyright © 2017 Hao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlString = "https://api.forecast.io/forecast/2f9a50a5c257c049e0d7e75cd291c7a0/10.7712755,106.6902094"
        
        Alamofire.request(urlString).responseJSON(completionHandler: { (response) in
            if let result = response.result.value as? [String : AnyObject] {
                if let area = Area(jsonData: result){
                    print(area)
                }
            } else {
                print("error")
            }
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



