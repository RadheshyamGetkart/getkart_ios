//
//  Utility.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import Foundation
import SwiftUICore

extension Font {
    enum ManropeFont {
        
        case semiBold
        case bold
        case medium
        case regular
        case extraBold
        
        case custom(String)
        
        var value: String {
            
            switch self {
                
            case .semiBold:
                return "Manrope-SemiBold"
                
            case .custom(let name):
                return name
            case .bold:
                return "Manrope-Bold"
            case .medium:
                return "Manrope-Medium"
            case .regular:
                return "Manrope-Regular"
            case .extraBold:
                return "Manrope-ExtraBold"
            }
        }
        
    }
    static func manrope(_ type: ManropeFont, size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
}



 extension Color {
     
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
