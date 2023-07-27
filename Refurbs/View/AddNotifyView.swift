//
//  NotifyView.swift
//  Refurbs
//
//  Created by Sjors van Uden on 27/07/2023.
//

import SwiftUI

struct AddNotifyView: View {
    let productTypes = ["Macbook", "iPad"]
    let memory = ["8gb", "16gb","24gb","32gb","64gb"]
    let cpu = ["M1", "M1 Pro","M1 Max","M2","M2 Pro","M2 Max"]
    let color = ["blue", "green","grey","silver","red"]
    let screensize = ["13inch", "14inch","15inch","16inch"]
    //@Binding var notifyList : [String]
    @State private var selectedProductTypeIndex = "Mac"
    @State private var showingAlert = false
    @State private var selectedMemoryIndex = "Memory"
    @State private var selectedCpuIndex = "M1"
    @State private var selectedColorIndex = "Grey"
    @State private var selectedScreensizeIndex = "13inch"
    @State  var itemName = ""
    @ObservedObject var itemStore: ItemStore
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack{
            Spacer()
            Spacer()
            Form{

                TextField("Notify name", text: $itemName).padding()

                Picker("Type", selection: $selectedProductTypeIndex)
                {
                    
                    ForEach(productTypes, id: \.self)
                    {
                        Text($0)
                    }
                }.padding()
                .pickerStyle(.navigationLink)
                Picker("Cpu", selection: $selectedCpuIndex)
                {
                    
                    ForEach(cpu, id: \.self)
                    {
                        Text($0)
                    }
                }.padding()
                .pickerStyle(.navigationLink)
                Picker("Memory", selection: $selectedMemoryIndex)
                {
                    
                    ForEach(memory, id: \.self)
                    {
                        Text($0)
                    }
                }.padding()
                .pickerStyle(.navigationLink)
                
                Picker("Color", selection: $selectedColorIndex)
                {
                    
                    ForEach(color, id: \.self)
                    {
                        Text($0)
                    }
                }.padding()
                .pickerStyle(.navigationLink)
                Picker("Screen Size", selection: $selectedScreensizeIndex)
                {
                    
                    ForEach(screensize, id: \.self)
                    {
                        Text($0)
                    }
                }
                .padding()
                .pickerStyle(.navigationLink)
                HStack{
                    Text("Add").frame(width: 300.0, height: 50.0).background(Color.blue.cornerRadius(10)).foregroundColor(.white).onTapGesture {
                        addItem()
                    }
            }.navigationBarTitle("Add a new Notify")


            }

        }

        .alert("Please enter a NotifyName", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }

    private func addItem() {
        if itemName == ""{
            showingAlert = true
            
        }
        else
        {
            showingAlert = false
            itemStore.addItem(name: itemName,type: selectedProductTypeIndex,cpu:selectedCpuIndex,memory:selectedMemoryIndex,color:selectedColorIndex,screensize: selectedScreensizeIndex )
            isPresented = false
        }
    }
}

