//
//  ViewController.swift
//  HelloWorld
//
//  Created by Adolfo Rodriguez on 2015-08-01.
//  Copyright (c) 2015 Relevant. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import BrightFutures

class WorldViewController: UIViewController {
    @IBOutlet weak var contentLabel: UILabel!

    @IBAction func touchRefresh(sender: AnyObject) {
        
        let url = "http://api.whatthetrend.com/api/v2/trends.json"
        
        request(.GET, url).responseJSON { (_, _, object, _) -> Void in
            
            Queue.main.async {
                
                if let obj:AnyObject = object {
                    
                    let json = JSON(obj)
                    
                    self.contentLabel.text = "\n".join(json["trends"].arrayValue.map{$0["name"].stringValue})
                    
                }else {
                    self.contentLabel.text = "ERROR"
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.touchRefresh(self)
    }


}

