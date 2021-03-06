//
//  StreamConfig.swift
//  
//
//  Created by CJ Pais on 8/29/20.
//

import Foundation
import CoreLocation

public struct Point: Encodable {
    var lat: Double
    var long: Double
}

public struct StreamConfig: Encodable {
    var namespace: String
    var name: String
    var version: String
    var uuid: UUID
    var fileName: String?
    var location: Point?
    var b64auth: String
    
    public init(namespace: String, name: String, version: String, uuid: UUID, filename: String? = nil, location: Point? = nil, b64auth: String) {
        self.namespace = namespace
        self.name = name
        self.version = version
        self.uuid = uuid
        self.fileName = filename
        self.location = location
        self.b64auth = b64auth
    }
}
