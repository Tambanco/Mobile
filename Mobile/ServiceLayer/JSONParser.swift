//
//  JSONParser.swift
//  Mobile
//
//  Created by tambanco 🥳 on 26.08.2022.
//

import Foundation

protocol Parcerable: AnyObject {
    static func parseHomeStoreData(data: Data) -> MainModel
}

class JSONParser: Parcerable {
    static func parseHomeStoreData(data: Data) -> MainModel {
        let decoder = JSONDecoder()
        var homeStoreData: [HomeStore] = []
        var bestSeller: [BestSeller] = []
        var mainData: MainModel = MainModel(homeStore: homeStoreData, bestSeller: bestSeller)
        
        do {
            let data = try decoder.decode(MainModel.self, from: data)
        } catch {
            print("parsing data failure")
        }
        
        return mainData
    }
}
