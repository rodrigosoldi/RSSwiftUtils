//
//  AttributedString+BoldNumbers.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 07/03/25.
//

import Foundation
import SwiftUI

public extension AttributedString {
    
    func formattedTextWithBoldNumbers(font: Font) -> AttributedString {
        var attributedString = self
        let regex = try? NSRegularExpression(pattern: "\\d+", options: [])
        let nsText = String(attributedString.characters) as NSString
        let matches = regex?.matches(in: String(attributedString.characters), options: [], range: NSRange(location: 0, length: nsText.length)) ?? []

        for match in matches {
            if let range = Range(match.range, in: self) {
                attributedString[range].font = font
            }
        }
        
        return attributedString
    }
}
