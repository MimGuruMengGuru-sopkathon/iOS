//
//  APIConstants.swift
//  MEMECHIN
//
//  Created by 이원석 on 2020/11/21.
//

import Foundation
struct APIConstants {
    static let baseURL = "http://3.35.211.158:3000"
    static let searchURL = APIConstants.baseURL + "/search?tag="
    static let search1URL = APIConstants.baseURL + "/search?tag=오늘의밈"
    static let search2URL = APIConstants.baseURL + "/search?tag=퇴사짤"
    
    static let detailURL = APIConstants.baseURL + "/detail?tag="
    static let detailTestURL = APIConstants.baseURL + "/detail?tag=퇴사짤"
    
}
