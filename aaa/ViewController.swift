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
        DownloadSingleton.sharedInstance.download("http://img06.deviantart.net/5313/i/2011/307/8/9/follow_the_river_7th_fantasy__big_size_by_burtn-d4ex6r5.jpg")
    }
    
    @IBAction func playme2(_ sender: Any) {
        DownloadSingleton.sharedInstance.download("http://orig04.deviantart.net/f06c/f/2010/324/a/2/avatar_upd_big_size_by_merychess-d30zufu.jpg")
    }
}

