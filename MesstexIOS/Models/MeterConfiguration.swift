//
//  MeterConfiguration.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 21.09.2021..
//

import Foundation

struct MeterConfiguration: Codable {
    var meterAppearance: String
    var fractionDigitsAuto: Bool
    var integerDigitsAuto: Bool
    var numberOfCountersAuto: Bool
    var fractionDigits: Int?
    var integerDigits: Int?
    var numberOfCounters: Int?
}
