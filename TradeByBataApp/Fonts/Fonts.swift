//
//  Fonts.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 17.03.2023.
//

import SwiftUI

struct AppFont {
    let body = Font.custom("Montserrat-regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
    let footnote = Font.custom("Montserrat-regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
}


struct FontSizeModifier: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-regular", size: size))
    }
}

struct FontStyleModifier: ViewModifier {
    var style: UIFont.TextStyle
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-regular", size: UIFont.preferredFont(forTextStyle: style).pointSize))
    }
}

extension Text {
    
    func fontSize(size: CGFloat) -> some View {
        ModifiedContent(
            content: self,
            modifier: FontSizeModifier(size: size)
        )
    }
    
    func fontStyle(style: UIFont.TextStyle) -> some View {
        ModifiedContent(
            content: self,
            modifier: FontStyleModifier(style: style)
        )
    }
}


