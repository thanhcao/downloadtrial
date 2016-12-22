//
//  ViewController.swift
//  aaa
//
//  Created by lavalamp on 12/21/16.
//  Copyright © 2016 biglabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        print("Document Path: \(documentsPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playme(_ sender: Any) {
        print("Play me")
        DownloadSingleton.sharedInstance.download("http://weknowyourdreams.com/images/beautiful/beautiful-02.jpg")
    }
    
    
}

