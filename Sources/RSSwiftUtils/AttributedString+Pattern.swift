//
//  AttributedString+Pattern.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 07/03/25.
//

import Foundation
import SwiftUI

extension AttributedString {

    public func updateTextStyleByPattern(
        prefix: String, suffix: String, font: Font? = nil, color: Color?
    ) -> AttributedString {
        let input = self
        var attributedString = input
        let pattern =
            "\(NSRegularExpression.escapedPattern(for: prefix))(.*?)(\(NSRegularExpression.escapedPattern(for: suffix)))"

        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return attributedString
        }

        let matches = regex.matches(
            in: String(input.characters), options: [],
            range: NSRange(input.startIndex..<input.endIndex, in: input))

        // Processa os matches em ordem reversa para evitar deslocamento dos índices ao modificar o texto
        for match in matches.reversed() {
            guard let groupRange = Range(match.range(at: 1), in: input),  // O conteúdo entre os delimitadores
                let fullRange = Range(match.range, in: attributedString)
            else { continue }

            let boldText = String(input[groupRange].characters)  // Texto sem delimitadores

            // Substitui a string original removendo os delimitadores e captura o novo range
            let replacementRange = fullRange
            attributedString.replaceSubrange(replacementRange, with: AttributedString(boldText))

            // O novo range começa no início do range original e tem o tamanho do texto sem delimitadores
            let newStart = replacementRange.lowerBound
            let newEnd = attributedString.index(newStart, offsetByCharacters: boldText.count)
            let updatedRange = newStart..<newEnd

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
