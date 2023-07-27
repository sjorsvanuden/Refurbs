//
//  RefurbProducts.swift
//  Refurbs
//
//  Created by Sjors van Uden on 22/07/2023.
//

import Foundation

// MARK: - Welcome
struct RefurbProducts: Codable {
    
    let tiles: [Tile]
}
// MARK: - Tile
struct Tile: Codable {
    let productDetailsURL: String
    let partNumber, title: String
    let price: Price
    let image: Image
    let filters: Product2
    enum CodingKeys: String, CodingKey {
        case productDetailsURL = "productDetailsUrl"
        case partNumber, title, price,image, filters
    }
}
struct Product2: Codable {
    let dimensions: ProductDimensions
}
struct ProductDimensions: Codable {
    let dimensionRelYear: String?
    let tsMemorySize: Optional<TsMemorySize>
}
struct Image: Codable {
    let srcSet: SrcSet
}
struct SrcSet: Codable {
    let src: String
}
struct Price: Codable {
    let currentPrice: CurrentPrice
}
struct CurrentPrice: Codable {
    let amount: String
}
enum TsMemorySize: String, Codable {
    case the128GB = "128gb"
    case the16GB = "16gb"
    case the24GB = "24gb"
    case the32GB = "32gb"
    case the64GB = "64gb"
    case the8GB = "8gb"
}


class JSONNull: Codable, Hashable {

public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
return true
}

public var hashValue: Int {
return 0
}

public init() {}

public required init(from decoder: Decoder) throws {
let container = try decoder.singleValueContainer()
if !container.decodeNil() {
    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
}
}

public func encode(to encoder: Encoder) throws {
var container = encoder.singleValueContainer()
try container.encodeNil()
}
}


struct Product:Identifiable{
    var id = UUID()
    var title:String
    var price:String
    var memory: TsMemorySize?
    var thumbnailName:String
    var productDetailsUrl: String
}
struct ProductType:Identifiable{
    var id = UUID()
    var title:String
    var products:[Product]
}
