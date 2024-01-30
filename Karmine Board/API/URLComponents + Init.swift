//
//  API.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 21/06/2023.
//

import Foundation

public extension URLComponents {

    init(schema: String = "https",
         host: String = "https://api.pandascore.co/lol",
         path: String,
         queryItems: [URLQueryItem]? = nil) {
        var components = URLComponents()
        components.scheme = schema
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}

extension URLComponents {
    static var users: Self {
        Self(path: "/leagues")
    }

    static func leaguesDetail(id: String) -> Self {
        let queryItems: [URLQueryItem] = [.init(name: "id", value: id)]
        return Self(path: "/leagues", queryItems: queryItems)
    }
}
