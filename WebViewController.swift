//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by BUKOLA OMOTOSO on 19/07/2016.
//  Copyright © 2016 ANDELA. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController  {
    var webView:WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
        let url = NSURL(string: "https://www.bignerdranch.com/")
        let requestObj = NSURLRequest(URL:url!)
        webView.loadRequest(requestObj)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
         print("WebViewController loaded its view")
    }
}
