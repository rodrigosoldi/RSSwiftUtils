//
//  String+BoldNumbers.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 07/03/25.
//

import Foundation
import SwiftUI

public extension String {
    
    func formattedTextWithBoldNumbers(font: Font) -> AttributedString {
        let attributedString = AttributedString(self)
        return attributedString.formattedTextWithBoldNumbers(font: font)
    }
    
}
