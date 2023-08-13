//
//  ItemStore.swift
//  Refurbs
//
//  Created by Sjors van Uden on 27/07/2023.
//

import Foundation

class ItemStore: ObservableObject {
    let userDefaults = UserDefaults.standard
    @Published var items: [Item]

    func addItem(type: String, cpu: String, memory: String, storage: String, color: String, screensize: String) {
        let newItem = Item(type: type,cpu:cpu,memory:memory,storage: storage, color:color,screensize:screensize)
        items.append(newItem)
        saveData()
    }
    init() {
        items = []
        if let savedData = userDefaults.object(forKey: "items3") as? Data {

            do{
                // 2
                let savedItems = try JSONDecoder().decode([Item].self, from: savedData)
                items = savedItems

            } catch {
                print("error")
            }
        }

    }
    func remove(offSets: IndexSet) {
        items.remove(atOffsets: offSets)
        saveData()
    }
    func saveData(){
        do{
            let encodedData = try JSONEncoder().encode(items)
            userDefaults.set(encodedData, forKey: "items3")
            print("gelukt")
        }
        catch{
            print("error")
        }
    }
}
