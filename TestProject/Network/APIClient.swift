//
//  APIClient.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class APIClient {
    
    static let sh = APIClient()
 
    private var dataTask: URLSessionDataTask?
    private lazy var session = URLSession(configuration: .default)
    
    private init () {}

    func request<T: Decodable>(completionHandler completion: @escaping (_ response: T?, _ error: ResponseError?) -> ()) {
        let url = "https://my.api.mockaroo.com/persons.json?key=f43efc60"
        let components = URLComponents(string: url)
        
        guard let componentsURL = components?.url else { return }
        let request = URLRequest(url: componentsURL)
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil, .invalidURL)
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .parsingError)
                return
            }
            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(result, nil)
                    } catch {
                        completion(nil, .parsingError)
                    }
                } else {
                    completion (nil, .parsingError)
                }
            } else {
                completion(nil, .networkError(code: httpResponse.statusCode))
            }
        }.resume()
    }
}
