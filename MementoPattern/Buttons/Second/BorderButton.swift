//
//  BorderButton.swift
//  MementoPattern
//
//  Created by 오킹 on 2023/12/02.
//

import UIKit

class BorderButton: MainButtonType {
    var borderColor: UIColor
    var titleFont: UIFont
    var titleColor: UIColor
    var borderWidth: CGFloat
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    
    init(borderColor: UIColor, titleFont: UIFont, titleColor: UIColor, borderWidth: CGFloat, horizontalPadding: CGFloat, verticalPadding: CGFloat) {
        self.borderColor = borderColor
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.borderWidth = borderWidth
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    convenience init() {
        self.init(borderColor: .tintColor,
                  titleFont: .systemFont(ofSize: 16, weight: .bold),
                  titleColor: .tintColor,
                  borderWidth: 1,
                  horizontalPadding: 12,
                  verticalPadding: 16)
    }
    
    
//    var borderColor: UIColor { return .tintColor }
//    var titleFont: UIFont { return .systemFont(ofSize: 16, weight: .bold) }
//    var titleColor: UIColor { return .tintColor }
//    var borderWidth: CGFloat { return 1 }
//    var horizontalPadding: CGFloat { return 16 }
//    var verticalPadding: CGFloat { return 12 }
    
    func updateUIForState(isEnabled: Bool) {
        print("updateUIForState: \(isEnabled)")
        
        if isEnabled {
            borderColor = .black
        } else {
            borderColor = .yellow
        }
    }
    
    func updateUIForHighlightState(isHighlight: Bool) {
        print("updateUIForHighlightState: \(isHighlight)")
        
        if isHighlight {
        
        } else {
            
        }
    }
}
