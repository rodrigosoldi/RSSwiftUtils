//
//  String.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 26/01/25.
//

import Foundation

public extension String {
 
    public func removeAccents() -> String {
        folding(options: .diacriticInsensitive, locale: .current)
    }
    
}
