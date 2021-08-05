//
//  ContactFormData.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import Foundation

struct ContactFormData: Codable {
    var name: String
    var email: String
    var subject: String
    var message: String
}
