//
//  Pageable.swift
//  Karmine Board
//
//  Created by Bilel BOURICHA on 26/06/2023.
//

import Foundation

public protocol Pageable {
    associatedtype Value: Identifiable & Hashable
    func loadPage(after currentPage: PageInfo, size: Int) async throws -> (items: [Value], info: PageInfo)
}
