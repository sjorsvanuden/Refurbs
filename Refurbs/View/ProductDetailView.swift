//
//  ProductDetailView.swift
//  Refurbs
//
//  Created by Sjors van Uden on 22/07/2023.
//

import SwiftUI
struct ProductDetailView: View {
    let product: Product
    @Environment(\.openURL) var openURL
    var body: some View {
        List{
            VStack (alignment: .center)
            {
                Text(product.title).bold()
                    .font(.system(size: 16))
                    .padding()
                Text(product.price)
                    .font(.system(size: 12))
                    .padding()
                AsyncImage(url: URL(string: product.thumbnailName)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                }
                
            placeholder: {
            }
                
                
                Text("View in Store").frame(width: 300.0, height: 50.0).background(Color.blue.cornerRadius(10)).foregroundColor(.white).onTapGesture {
                    openURL(URL(string: product.productDetailsUrl)!)
                }
                
            }
            NavigationLink{
                ProductDetailSpecs(product: product)
            }
        label: {
            Text("Specifications")
        }
        }
    }
}


                               
        
    

