//
//  PostModelRecord.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import Foundation

struct PostModelRecord: Codable{
    var verificationCode: String
    var language: String
    var meterReadings: Array<MeterReadingData>
    var firstName: String
    var secondName: String
    var email: String
    var phone: String
    var sendCopy: Bool
}
