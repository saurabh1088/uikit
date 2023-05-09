//
//
// WebViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 08/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    var url: URL?
    var onSuccess: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        activityLoader.hidesWhenStopped = true
        loadURL()
    }
    
    private func loadURL() {
        if let url = url {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            activityLoader.startAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityLoader.stopAnimating()
        if webView.url == url,
           let onSuccess = onSuccess {
            onSuccess()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityLoader.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityLoader.startAnimating()
    }
}
