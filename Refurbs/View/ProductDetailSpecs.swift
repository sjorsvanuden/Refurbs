//
//  ProductDetailSpecs.swift
//  Refurbs
//
//  Created by Sjors van Uden on 23/07/2023.
//

import SwiftUI
import WebKit
import SwiftSoup
struct ProductDetailSpecs : View {
    let product: Product
    let webView1 = WKWebView()
    var body: some View {
        HTMLView()
        .navigationTitle(product.title)
    }
    
    struct HTMLView: UIViewRepresentable {
        typealias UIViewType = WKWebView
     
        // 4
        // Access the `homepage.html` file that is stored in the app bundle
        var fileURL: URL {
            guard let url = Bundle.main.url(forResource: "homepage", withExtension: "html") else {
                fatalError("path does not exist")
            }
            return url
        }
     
        /// Accepts a user HTML string e.g <p>SwiftUI is <b>awesome</b></p>
        var htmlString = "<html><body><p>Hello!</p></body></html>"
     
        func makeUIView(context: Context) -> WKWebView {
            // 5
            // Configure the WKWebView
            let config = WKWebViewConfiguration()
            let webView = WKWebView(frame: .zero, configuration: config)
            // 6
            // Part of the configuration is to allow for back-and-forth navigation between web pages.
            webView.allowsBackForwardNavigationGestures = true
            return webView
        }
     
        func updateUIView(_ uiView: WKWebView, context: Context) {
             
           
            // 8
            // If the user passes an HTML string this page will be rendered
            uiView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
}
