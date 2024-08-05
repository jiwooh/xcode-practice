//
//  WebView.swift
//  test
//
//  Created by minn on 8/5/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  var url: String
  typealias Context = UIViewRepresentableContext<WebView>
  
  func makeUIView(context: Context) -> WKWebView {
    // unwrap url
    guard let url = URL(string: self.url) else {
      return WKWebView()
    }
    
    // make and load webview
    let webview = WKWebView()
    webview.load(URLRequest(url: url))
                 
    return webview
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {}
}

#Preview {
  WebView(url: "google.com")
}
