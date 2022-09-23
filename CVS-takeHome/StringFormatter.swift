//
//  StringFormatter.swift
//  CVS-takeHome
//
//  Created by Maher Damouni on 9/23/22.
//

import Foundation

struct StringFormatter {
    
    static func trimHeightWidth(from description: String) -> String {
        
        guard let widthIndex = description.range(of: "width")?.lowerBound else { return ""}
        guard let altIndex = description.range(of: "alt")?.upperBound else { return "" }
        
        var heightWidth = String(description[widthIndex..<altIndex])
        
        for _ in 0...3 {
            
            heightWidth.removeLast()
        }
        
        return heightWidth
    }
}
