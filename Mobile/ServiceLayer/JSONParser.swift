//
//  JSONParser.swift
//  Mobile
//
//  Created by tambanco 🥳 on 26.08.2022.
//

import Foundation

protocol Parcerable: AnyObject {
    static func parseHomeStoreData(json: Data) -> [HomeStore]
}

class JSONParser: Parcerable {
    static func parseHomeStoreData(json: Data) -> [HomeStore] {
        let decoder = JSONDecoder()
        var homeStoreData: [HomeStore] = []
        
        do {
            let data = try decoder.decode(HomeStore.self, from: json)
            homeStoreData = [data]
            
        } catch {
            print("parsing data failure")
        }
        
        return homeStoreData
    }
}
