//
//  Item.swift
//  Refurbs
//
//  Created by Sjors van Uden on 27/07/2023.
//

import Foundation
struct Item: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let cpu: String
    let memory: String
    let color: String
    let screensize: String
}
