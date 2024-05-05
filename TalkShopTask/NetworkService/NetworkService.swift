//
//  NetworkService.swift
//  TalkShopTask
//
//  Created by VS on 05/05/24.
//

import Foundation

class NetworkService {
    func fetchData<T: Decodable>(jsonFile: String,completion: @escaping (Result<T, Error>) -> Void) {

        guard let fileURL = Bundle.main.url(forResource: jsonFile, withExtension: "json") else {
            fatalError("data.json not found in bundle")
        }
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}
