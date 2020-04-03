//
//  BaseData.swift
//  NCOV Status
//
//  Created by LeHung on 4/3/20.
//  Copyright © 2020 LeHung. All rights reserved.
//

import Foundation

struct BaseData: Decodable {
    let updated: String
    let data: [CovidData]
}
