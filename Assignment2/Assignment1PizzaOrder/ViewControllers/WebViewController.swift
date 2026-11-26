//  WebViewController.swift
//  Assignment1PizzaOrder
//
//  Created by Ryan Franco on 2026-09-27.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webKit: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlAddress = URL(string: "https://www.pizzahut.ca")
        
        let url = URLRequest(url: urlAddress!)
        
        webKit.navigationDelegate = self
        webKit.load(url)
        
        
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation:WKNavigation!){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
    }
    
    
    
    
}
