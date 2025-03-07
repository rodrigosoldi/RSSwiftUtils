//
//  AttributedString+Pattern.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 07/03/25.
//

import Foundation
import SwiftUI

public extension AttributedString {
    
    func updateTextStyleByPattern(prefix: String, suffix: String, font: Font? = nil, color: Color?) -> AttributedString {
        let input = self
        var attributedString = input
        let pattern = "\(NSRegularExpression.escapedPattern(for: prefix))(.*?)(\(NSRegularExpression.escapedPattern(for: suffix)))"
        
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return attributedString
        }
        
        let matches = regex.matches(in: String(input.characters), options: [], range: NSRange(input.startIndex..<input.endIndex, in: input))

        // Processa os matches em ordem reversa para evitar deslocamento dos índices ao modificar o texto
        for match in matches.reversed() {
            guard let groupRange = Range(match.range(at: 1), in: input), // O conteúdo entre os delimitadores
                  let fullRange = Range(match.range, in: attributedString) else { continue }

            let boldText = String(input[groupRange].characters) // Texto sem delimitadores

            // Substitui a string original removendo os delimitadores
            attributedString.replaceSubrange(fullRange, with: AttributedString(boldText))

            // Encontra o intervalo exato do texto substituído
            let startIndex = attributedString.index(attributedString.startIndex, offsetByCharacters: match.range(at: 0).location)
            let endIndex = attributedString.index(startIndex, offsetByCharacters: match.range(at: 1).length)
            let updatedRange = startIndex..<endIndex

            // Aplica o estilo bold e cor no novo intervalo
            if let font {
                attributedString[updatedRange].font = font
            }
            if let color {
                attributedString[updatedRange].foregroundColor = color
            }
        }

        return attributedString
    }
    
}
