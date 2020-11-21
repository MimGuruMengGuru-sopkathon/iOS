//
//  Search.swift
//  MEMECHIN
//
//  Created by 최영재 on 2020/11/22.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [SearchData]
}

// MARK: - SearchData
struct SearchData: Codable {
    let id: Int
    let tag: String
    let imageURI: String
}
