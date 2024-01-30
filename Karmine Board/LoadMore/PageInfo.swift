//
//  PageInfo.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 26/06/2023.
//

import Foundation

public struct PageInfo: Equatable, Codable {
    public let hasNextPage: Bool
    public let endCursor: String?
    public static let `default`: PageInfo = PageInfo(hasNextPage: true, endCursor: nil)
}
