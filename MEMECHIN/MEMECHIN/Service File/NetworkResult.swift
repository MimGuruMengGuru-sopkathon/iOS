//
//  NetworkResult.swift
//  MEMECHIN
//
//  Created by 최영재 on 2020/11/22.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
