//
//  UtilizationResponseModel.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import Foundation

struct UtilizationResponseModel: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var street: String
    var houseNumber: String
    var postcode: String
    var city: String
    var floor: String
    var readingReason: String
    var meters: Array<MeterReceivingData>
}
