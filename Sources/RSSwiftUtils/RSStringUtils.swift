//
//  RSStringUtils.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 25/01/25.
//

import Foundation
import SwiftUI

public extension String {
    
    func updateTextStyleByPattern(prefix: String, suffix: String, font: Font? = nil, color: Color?) -> AttributedString {
        let input = self
        var attributedString = AttributedString(input)
        let pattern = "\(NSRegularExpression.escapedPattern(for: prefix))(.*?)\(NSRegularExpression.escapedPattern(for: suffix))"
        
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return attributedString
        }
        
        let matches = regex.matches(in: input, options: [], range: NSRange(input.startIndex..<input.endIndex, in: input))
        
        for match in matches.reversed() {
            
            guard let groupRange = Range(match.range(at: 1), in: input),
                  let fullRange = Range(match.range, in: attributedString) else { continue }
            
            
            let boldText = String(input[groupRange])
            attributedString.replaceSubrange(fullRange, with: AttributedString(boldText))
                    
            if let updatedRange = attributedString.range(of: boldText) {
                if let font {
                    attributedString[updatedRange].font = font
                }
                
                if let color {
                    attributedString[updatedRange].foregroundColor = color
                }                
            }
        }
        
        return attributedString
    }
    
}
