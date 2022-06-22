//
//  APICaller.swift
//  SwiftGenericsExample
//
//  Created by Paulo Orquillo on 22/06/22.
//

import Foundation

class APICaller {
    // call itself - use case?
    static let shared = APICaller()
    
    //generic function that accepts struct conforming to Codable
    public func performAPICall<T:Codable>(url: String, expectingReturnType: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            var decodedResult: T?
            do {
                decodedResult = try JSONDecoder().decode(T.self, from: data)
            } catch {
               print("error decoding")
            }
            guard let result = decodedResult  else {
                //call failure case
                return
            }
            // this is the callback which returns the results
            completion(.success(result))
        })
        //resumes the task if suspended
        task.resume()
    }
}

// conform to codable protocol which allows decoding JSON to the struct
struct Fruit: Codable {
    let name: String
    let identifier: String
    let imageName: String
}

struct Car: Codable {
    let name: String
    let modelName: String
    let identifier: String
    let imageName: String
}

struct Recipe: Codable {
    let name: String
    let category: String
    let identifier: String
    let imageName: String
}
