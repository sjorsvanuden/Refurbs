//
//  ProductDetailView.swift
//  Refurbs
//
//  Created by Sjors van Uden on 22/07/2023.
//

import SwiftUI
struct NotifyDetailView: View {
    let item: Item
    var body: some View {
        
        NavigationView {
            List{
                HStack{
                    Text("Name:")
                    Text(item.name).bold()
                        .font(.system(size: 16))
                }
                HStack{
                    Text("Type:")
                    Text(item.type).bold()
                        .font(.system(size: 16))
                }
                    HStack{
                        Text("Cpu:")
                        Text(item.cpu).bold()
                            .font(.system(size: 16))
                    }
                    HStack{
                        Text("Color:")
                        Text(item.color).bold()
                            .font(.system(size: 16))
                    }
                    HStack{
                        Text("Memory:")
                        Text(item.memory).bold()
                            .font(.system(size: 16))
                    }
                    HStack{
                        Text("Screen Size:")
                        Text(item.screensize).bold()
                            .font(.system(size: 16))
                    }
            }
            .navigationBarTitle(item.name
            )}
    }
    
}





