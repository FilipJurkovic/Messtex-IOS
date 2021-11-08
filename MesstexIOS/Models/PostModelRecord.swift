//
//  PostModelRecord.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import Foundation

struct PostModelRecord: Codable {
    var verificationCode: String
    var language: String
    var meterReadings: [MeterReadingData]
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var sendCopy: Bool
    var getMeterReadingLetterByEmail: Bool
    var subscribeNewsletter: Bool
}
