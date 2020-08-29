//
//  StreamConfig.swift
//  
//
//  Created by CJ Pais on 8/29/20.
//

import Foundation

public struct StreamConfig: Encodable {
    var namespace: String
    var name: String
    var version: String
    
    public init(namespace: String, name: String, version: String) {
        self.namespace = namespace
        self.name = name
        self.version = version
    }
}
