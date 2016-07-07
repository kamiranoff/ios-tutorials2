//
//  LoadWebRequest.swift
//  webrequest-test
//
//  Created by Kevin Amiranoff on 07/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation
import WebKit

class LoadWebRequest:WKWebView{
  
  private var webView:WKWebView!
  
  internal func loadWebView(string:String,container:UIView){
    webView = WKWebView()
    container.addSubview(webView)
    let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
    webView.frame = frame
    
    let urlStr = string
    let url = NSURL(string: urlStr )!
    let request = NSURLRequest(URL: url)
    
    webView.loadRequest(request)

    
  }
}