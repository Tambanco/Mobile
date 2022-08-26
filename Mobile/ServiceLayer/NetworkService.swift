//
//  NetworkService.swift
//  Mobile
//
//  Created by tambanco 🥳 on 26.08.2022.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

protocol NetworkServiceProtocol: Codable {
    func getMainData(completion: @escaping (Result<[String]?, Error>) -> Void)
}

final class NewtworkService: NetworkServiceProtocol {
    func getMainData(completion: @escaping (Result<[String]?, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            print(data)
            let json = String(data: data, encoding: .utf8)!.data(using: .utf8)!
            var fiatList: [String] = []
            fiatList = JSONParser.parseCurrencyList(json: json)
            completion(.success(fiatList))
        }
        task.resume()
    }
}
