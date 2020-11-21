//
//  Models.swift
//  MEMECHIN
//
//  Created by 이윤진 on 2020/11/22.
//

import Foundation

struct ResponseResult<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: [T]?
}
