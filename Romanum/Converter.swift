//
//  Converter.swift
//  Romanum
//
//  Created by Dave Buitenhuis on 19-01-16.
//  Copyright © 2016 Dave Buitenhuis. All rights reserved.
//

import Foundation

class Converter: DataManager {
    func toRoman(_ number: Int) -> String? {
        
        // Patch voor Swift 3, 'var' word niet meer ondersteund in de parameters.
        var number = number
        
        var value = ""
        if number < 1 {
            return nil
        }
        for (romanValue, arabicValue) in values {
            // Als sum niet gelijk is aan 0, ga door met de iteratie aangezien het getal niet aftrekbaar is van het meegegeven getal.
            let sum = number / arabicValue
            if sum == 0 { continue }
            for _ in 1...sum {
                value += romanValue
                number -= arabicValue
            }
        }
        return value
    }
    
    func toArabic(_ number: String) -> String? {
        var roman = number.characters
        var value = 0
        while !roman.isEmpty {
            // Zoek de bijbehorende character uit de dictionary values die beginnen met dezelfde characters als het meegegeven nummer.
            for (romanChar, arabicValue) in values where roman.starts(with: romanChar.characters) {
                value += arabicValue
                // Verwijder de 1ste & 2de characters van de string zodat ze niet herhaald worden.
                roman = roman.dropFirst(romanChar.characters.count)
            }
        }
        
        return String(value)
    }
}
