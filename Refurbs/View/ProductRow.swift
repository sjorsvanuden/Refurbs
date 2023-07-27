//
//  ProductRow.swift
//  Refurbs
//
//  Created by Sjors van Uden on 22/07/2023.
//

import SwiftUI
import Foundation
struct ProductRow: View {
    let product: Product
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnailName)) { image in
                image
                    .resizable()
                    //.scaledToFit()
                    
                    .frame(width: 100, height: 100, alignment: .trailing)
                VStack (alignment: .leading, spacing: 10) {
                    
                    Text(product.title).bold()
                        .font(.system(size: 12))
                    Text(product.price)
                        .font(.system(size: 12))
                }
            } placeholder: {
                //ProgressView()
            }
                Spacer()
            }
        }
    }

