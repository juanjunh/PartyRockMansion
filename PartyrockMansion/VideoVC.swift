//
//  VideoVC.swift
//  PartyrockMansion
//
//  Created by JanielHNY on 2017/9/17.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
