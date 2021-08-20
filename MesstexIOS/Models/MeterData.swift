//
//  MeterData.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import Foundation

struct MeterReadingData: Codable{
    var counterNumber: String
    var counterType: String
    var counterValue: String
    var userMessage: String
}

struct MeterReceivingData: Codable{
    var counterNumber: String
    var counterType: String
    var counterRoom: String
    var counterTypeName: String
    var counterDescriptionText: String
    var counterDescriptionImage: String
}
