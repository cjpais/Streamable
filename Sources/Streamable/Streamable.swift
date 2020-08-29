//
//  Streamable.swift
//
//
//  Created by CJ Pais on 8/29/20.
//

import Foundation

struct Streamable<T: Encodable>: Encodable {
    var config: StreamConfig
    var data: T
    
    public init(config: StreamConfig, data: T) {
        self.config = config
        self.data = data
    }
    
    public func sendStream(to baseURL: String) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            if let url = URL(string: baseURL + "/stream") {
                var request = URLRequest(url: url)
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = "POST"
                request.httpBody = data
                
                let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                    if error != nil {
                        print(error!)
                    }
                }
                
                dataTask.resume()
            } else {
                print("URL couldn't be created")
            }
        } catch {
            print(error)
        }
    }
}
