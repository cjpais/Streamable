//
//  Streamable.swift
//
//
//  Created by CJ Pais on 8/29/20.
//

import Foundation

@available(OSX 10.15, *)
public struct StreamableData<T: Encodable>: Encodable {
    
    var config: StreamConfig
    var data: T
    var userData: String?

    public init(config: StreamConfig, data: T, userData: String? = nil) {
        self.config = config
        self.data = data
        self.userData = userData // must be a base64 encoded string
    }
    
    @available(iOS 10.0, *)
    public func sendStream(to baseURL: String, completionHandler: @escaping (_: Error?) -> ()) {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let data = try encoder.encode(self)
            if let url = URL(string: baseURL + "/stream") {
                var request = URLRequest(url: url)
                
                print("sending to URL:", url.absoluteURL)
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Basic \(config.b64auth)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "POST"
                request.httpBody = data
        
                print("data is", String(data: data, encoding: .utf8)!)
                
                let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                    print("completed")
                    if error != nil {
                        print(error!)
                    }
                    completionHandler(error)
                }
                
                dataTask.resume()
            } else {
                print("URL couldn't be created")
            }
        } catch {
            print(error)
            completionHandler(error)
        }
    }
}
