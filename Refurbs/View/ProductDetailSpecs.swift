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
        var fileURL: URL {
            guard let url = Bundle.main.url(forResource: "homepage", withExtension: "html") else {
                fatalError("path does not exist")
            }
            return url
        }
        var htmlString = "<html><body><p>Hello!</p></body></html>"
     
        func makeUIView(context: Context) -> WKWebView {
            let config = WKWebViewConfiguration()
            let webView = WKWebView(frame: .zero, configuration: config)
            webView.allowsBackForwardNavigationGestures = true
            return webView
        }
     
        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
}
