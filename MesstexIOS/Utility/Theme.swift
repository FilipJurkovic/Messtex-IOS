//
//  Theme.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 15.07.2021..
//

import CoreGraphics
import Foundation
import SwiftUI

extension Color {

    static var danger: Color {
        Color("Danger")
    }

    static var warning: Color {
        Color("Warning")
    }

    static var success: Color {
        Color("Success")
    }

    static var dark: Color {
        Color("Dark")
    }

    static var light: Color {
        Color("Light")
    }

    static var medium: Color {
        Color("Medium")
    }

    static var primary_color: Color {
        Color("Primary")
    }

    static var primary_30: Color {
        Color("Primary_30")
    }

    static var primary_shade: Color {
        Color("Primary_shade")
    }

    static var primary_tint: Color {
        Color("Primary_tint")
    }

    static var secondary: Color {
        Color("Secondary")
    }

    static var secondary_30: Color {
        Color("Secondary_30")
    }

    static var secondary_shade: Color {
        Color("Secondary_shade")
    }

    static var secondary_tint: Color {
        Color("Secondary_tint")
    }

    static var tetriary: Color {
        Color("Tetriary")
    }

    static var tetriary_30: Color {
        Color("Tetriary_30")
    }

    static var tetriary_shade: Color {
        Color("Tetriary_shade")
    }

    static var tetriary_tint: Color {
        Color("Tetriary_tint")
    }

}

extension UIColor {

    static var danger: UIColor {
        UIColor(named: "Danger")!
    }

    static var warning: UIColor {
        UIColor(named: "Warning")!
    }

    static var success: UIColor {
        UIColor(named: "Success")!
    }

    static var dark: UIColor {
        UIColor(named: "Dark")!
    }

    static var light: UIColor {
        UIColor(named: "Light")!
    }

    static var medium: UIColor {
        UIColor(named: "Medium")!
    }

    static var primary: UIColor {
        UIColor(named: "Primary")!
    }

    static var primary_30: UIColor {
        UIColor(named: "Primary_30")!
    }

    static var primary_shade: UIColor {
        UIColor(named: "Primary_shade")!
    }

    static var primary_tint: UIColor {
        UIColor(named: "Primary_tint")!
    }

    static var secondary: UIColor {
        UIColor(named: "Secondary")!
    }

    static var secondary_30: UIColor {
        UIColor(named: "Secondary_30")!
    }

    static var secondary_shade: UIColor {
        UIColor(named: "Secondary_shade")!
    }

    static var secondary_tint: UIColor {
        UIColor(named: "Secondary_tint")!
    }

    static var tetriary: UIColor {
        UIColor(named: "Tetriary")!
    }

    static var tetriary_30: UIColor {
        UIColor(named: "Tetriary_30")!
    }

    static var tetriary_shade: UIColor {
        UIColor(named: "Tetriary_shade")!
    }

    static var tetriary_tint: UIColor {
        UIColor(named: "Tetriary_tint")!
    }
}

struct Heading2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Bold", size: 18))
    }
}

extension View {
    func heading2() -> some View {
        self.modifier(Heading2())
    }
}

extension Text {
    func pincodeFont() -> Text {
        self.font(Font.custom("Roboto-Bold", size: 56))
            .kerning(28.5)
            .foregroundColor(.primary_color)
    }
}

struct Heading1: ViewModifier {
    func body(content: Content) -> some View {
        content

            .font(Font.custom("Roboto-Medium", size: 24))
    }
}

extension View {
    func heading1() -> some View {
        self.modifier(Heading1())
    }
}

struct Paragraph: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Reagular", size: 14))
    }
}

extension View {
    func paragraph() -> some View {
        self.modifier(Paragraph())
    }
}

struct ParagraphBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Bold", size: 14))
    }
}

extension View {
    func paragraphBold() -> some View {
        self.modifier(ParagraphBold())
    }
}

struct Small: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Regular", size: 12))
    }
}

extension View {
    func small() -> some View {
        self.modifier(Small())
    }
}

struct SmallBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Bold", size: 12))
    }
}

extension View {
    func smallBold() -> some View {
        self.modifier(SmallBold())
    }
}

struct Tiny: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Regular", size: 10))
    }
}

extension View {
    func tiny() -> some View {
        self.modifier(Tiny())
    }
}

struct TinyBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Roboto-Bold", size: 10))
    }
}

extension View {
    func tinyBold() -> some View {
        self.modifier(TinyBold())
    }
}
