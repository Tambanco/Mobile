//
//  JSONParser.swift
//  Mobile
//
//  Created by tambanco 🥳 on 26.08.2022.
//

import Foundation

protocol Parcerable: AnyObject {
    static func parseHomeStoreData(json: Data) -> [String]
}

class JSONParser: Parcerable {
    static func parseHomeStoreData(json: Data) -> [String] {
        let decoder = JSONDecoder()
        var homeStoreData: [String] = []
        
        do {
            let data = try decoder.decode(HomeStore.self, from: json)
        } catch {
            print("parsing symbols failure")
        }
        
        return homeStoreData
    }
}
