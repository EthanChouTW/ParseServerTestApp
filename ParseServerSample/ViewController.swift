//
//  ViewController.swift
//  ParseServerSample
//
//  Created by pp1285 on 2016/5/9.
//  Copyright © 2016年 EthanChou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameScore = PFObject(className: "GameScore")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
    }


    @IBAction func post(sender: AnyObject) {
        
        gameScore.setObject(1337, forKey: "score")
        gameScore.setObject("Sean Plott", forKey: "playerName")
        gameScore.saveInBackgroundWithBlock { (success:Bool, error:NSError?) in
            if success {
                print("object created with id: \(self.gameScore.objectId!)")
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    @IBAction func get(sender: AnyObject) {
        let query = PFQuery(className: "GameScore")
        query.getFirstObjectInBackgroundWithBlock ({ (firstOne:PFObject?, error:NSError?) in
            print("my first column : \(firstOne?.objectId!)")
        
        })
    }
}

