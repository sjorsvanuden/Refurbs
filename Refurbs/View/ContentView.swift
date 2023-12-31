//
//  ProductList.swift
//  Refurbs
//
//  Created by Sjors van Uden on 27/06/2023.
//

import SwiftUI
import WebKit
import Foundation
import SwiftSoup



struct ContentView: View
{
    @ObservedObject var refurbFetcher : RefurbFetcher
    @State private var selectedItemCpu:String = "M1"
    @State private var selectedItemMemory:String = "8gb"
    @State private var selectedItemType:String = "mac"
    @Binding var selectedCountry:String
    var tempCountry = "nl"
    @State private var isFiltering = false
    
    var body: some View {
        NavigationView
        {
            List(refurbFetcher.products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label:
                {
                    ProductRow(product: product)
                }
            }
            .navigationBarTitle("Products")
            .navigationBarItems(trailing: filterButton)

            .onChange(of: selectedItemMemory, perform: {  value in
                refurbFetcher.download(cpu: selectedItemCpu, memory: value, type: selectedItemType,country: selectedCountry)})
            .onChange(of: selectedItemCpu, perform: {  value in
                refurbFetcher.download(cpu: value, memory: selectedItemMemory, type: selectedItemType,country: selectedCountry)})
            .onChange(of: selectedItemType, perform: {  value in
                refurbFetcher.download(cpu: selectedItemCpu, memory: selectedItemMemory, type: value,country: selectedCountry)})
            .listStyle(GroupedListStyle())
            .onAppear(perform: {refurbFetcher.download(cpu: self.selectedItemCpu,memory: self.selectedItemMemory, type: self.selectedItemType, country: self.selectedCountry)})
            
            .sheet(isPresented: $isFiltering) {
                FilterView(selectedItemCpu: $selectedItemCpu, selectedItemMemory: $selectedItemMemory,selectedItemType: $selectedItemType)
            }
        }
    }
    
    private var filterButton: some View {
        
        SwiftUI.Button(action: {
            isFiltering = true
        }) {
            Text("Filter")
            SwiftUI.Image(systemName: "line.horizontal.3.decrease.circle.fill")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let refurbfetcher = RefurbFetcher()
        ContentView(refurbFetcher: refurbfetcher, selectedCountry: .constant("de"))
    }
}

