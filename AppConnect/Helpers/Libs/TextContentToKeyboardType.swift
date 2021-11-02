//
//  TextContentToKeyboardType.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

class TextContentToKeyboardType {
    static func converter(inputType: UITextContentType) -> UIKeyboardType {
        switch inputType {
        case .name, .namePrefix, .givenName, .middleName, .familyName, .nameSuffix, .jobTitle, .organizationName, .location, .fullStreetAddress, .streetAddressLine1, .streetAddressLine2, .addressCity, .addressState, .sublocality, .countryName, .username, .password, .oneTimeCode:
            return .default
        case .postalCode, .telephoneNumber, .creditCardNumber, .cpf:
            return .numberPad
        case .emailAddress:
            return .emailAddress
        case .URL:
            return .URL
        default:
            return .default
        }
    }
}
