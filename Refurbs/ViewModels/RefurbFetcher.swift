//
//  Product.swift
//  Refurbs
//
//  Created by Sjors van Uden on 27/06/2023.
//
import Foundation
import SwiftSoup


class RefurbFetcher: ObservableObject   {
    
    //@Published var productType: [ProductType] = []
    @Published var products : [Product] = []

    func download(cpu: String, memory: String, type: String,country: String) -> Void{
        self.products.removeAll()
        let url = URL(string: "https://www.apple.com/\(country)/shop/refurbished/\(type)")!
        downloadHTML(from: url) { htmlString in
            if let htmlString = htmlString {
                if let javascriptCode = self.parseHTMLForJavaScript(htmlString: htmlString) {
                    if var json = javascriptCode as? String {
                        json = json.replacingOccurrences(of: "window.REFURB_GRID_BOOTSTRAP =", with: "")
                        json = json.replacingOccurrences(of: "};", with: "}")
                        //DEBUG
                       // print(json)
                        if let data = json.data(using: .utf8) {
                            do {
                                let welcome = try JSONDecoder().decode(RefurbProducts.self, from: data)
                                    // print("decoded")
                                    //  print(json)
                                    for tile in welcome.tiles{
                                        let title = tile.title
                                        let price = tile.price.currentPrice.amount
                                        let image = tile.image.srcSet.src
                                        print(image)
                                        let productDetailsUrl = "https://www.apple.com" + tile.productDetailsURL
                                        print(type)
                                        if type == "ipad"{
                                            self.products.append(Product(type: type, title: title, price: price, thumbnailName: image, productDetailsUrl: productDetailsUrl))
                                        }
                                        if tile.title.contains(cpu)  {
                                            print(tile)
                                            let memorySize = tile.filters.dimensions.tsMemorySize
                                            if memorySize?.rawValue == memory && type == "mac"{
                                                self.products.append(Product(type: type, title: title, price: price, memory: memorySize, thumbnailName: image, productDetailsUrl: productDetailsUrl))
                                            }

                                        }
                                    }
                            }
                            catch{
                                print(error)
                            }
                           
                            //self.products.append())
                            print(self.products.count)
                            
                        }
                    }
                } else {
                    print("Javascript block not found")
                }
            } else {
                print("Error downloading HTML.")
            }
        }
    }

    func downloadHTML(from url: URL, completion: @escaping (String?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let htmlString = String(data: data, encoding: .utf8) else {
                completion(nil)
                return
            }
            completion(htmlString)
        }
        task.resume()
    }
    
    func parseHTMLForJavaScript(htmlString: String) -> String? {
        do {
            let doc = try SwiftSoup.parse(htmlString)
            let scriptElements = try doc.select("script")
            
            for scriptElement in scriptElements {
                if let script = try? scriptElement.html(), script.contains("window.REFURB_GRID_BOOTSTRAP") {
                    return script
                }
            }
        } catch {
            print("Error parsing HTML: \(error)")
        }
        return nil
    }
}






