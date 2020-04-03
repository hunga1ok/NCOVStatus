//
//  CovidData.swift
//  NCOV Status
//
//  Created by LeHung on 4/3/20.
//  Copyright © 2020 LeHung. All rights reserved.
//

import Foundation

struct CovidData: Decodable {
    let country: String
    let cases: String
    let deaths: String
    let recovered: String
}
