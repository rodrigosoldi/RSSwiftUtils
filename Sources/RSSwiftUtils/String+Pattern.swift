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
        return AttributedString(self).updateTextStyleByPattern(prefix: prefix, suffix: suffix, font: font, color: color)
    }
    
}
