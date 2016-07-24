//
//  ViewController.swift
//  QuickAndNimble
//
//  Created by JAVIER CALATRAVA LLAVERIA on 23/07/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class BasicFormVC: UIViewController {
    
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var btnAge: UIButton!
    @IBOutlet weak var lblAge: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK : - IBAction
    
    
    @IBAction func btnAgeTouchUpInside(sender: AnyObject) {
        
        self.lblAge.text = self.txtAge.text
    }
}

