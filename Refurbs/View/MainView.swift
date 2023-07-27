//
//  MainView.swift
//  Refurbs
//
//  Created by Sjors van Uden on 22/07/2023.
//

import SwiftUI

struct MainView: View {
    let refurbFetcher = RefurbFetcher()
    let itemStore = ItemStore()
    @Binding var selectedCountry:String
   // @State private var selectedItemCpu:String = "M1"
    var body: some View {
        TabView {
            ContentView(refurbFetcher: refurbFetcher, selectedCountry: $selectedCountry)
                       .tabItem {
                           Label("Products", systemImage: "list.dash")
                       }

            NotifyListView(itemStore: itemStore)
                       .tabItem {
                           Label("Notify", systemImage: "bell")
                       }
               }
            

        }
    }

