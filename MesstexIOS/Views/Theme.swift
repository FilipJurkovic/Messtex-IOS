//
//  Theme.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 15.07.2021..
//

import SwiftUI
import Foundation
import CoreGraphics

extension Color {

    static var danger: Color {
        return Color("Danger")
    }

    static var warning: Color {
        return Color("Warning")
    }

    static var success: Color {
        return Color("Success")
    }

    static var dark: Color {
        return Color("Dark")
    }

    static var light: Color {
        return Color("Light")
    }

    static var medium: Color {
        return Color("Medium")
    }

    static var primary_color: Color {
        return Color("Primary")
    }

    static var primary_30: Color {
        return Color("Primary_30")
    }

    static var primary_shade: Color {
        return Color("Primary_shade")
    }

    static var primary_tint: Color {
        return Color("Primary_tint")
    }

    static var secondary: Color {
        return Color("Secondary")
    }

    static var secondary_30: Color {
        return Color("Secondary_30")
    }

    static var secondary_shade: Color {
        return Color("Secondary_shade")
    }

    static var secondary_tint: Color {
        return Color("Secondary_tint")
    }

    static var tetriary: Color {
        return Color("Tetriary")
    }

    static var tetriary_30: Color {
        return Color("Tetriary_30")
    }

    static var tetriary_shade: Color {
        return Color("Tetriary_shade")
    }

    static var tetriary_tint: Color {
        return Color("Tetriary_tint")
    }

}

extension UIColor {

    static var danger: UIColor {
        return UIColor(named: "Danger")!
    }

    static var warning: UIColor {
        return UIColor(named: "Warning")!
    }

    static var success: UIColor {
        return UIColor(named: "Success")!
    }

    static var dark: UIColor {
        return UIColor(named: "Dark")!
    }

    static var light: UIColor {
        return UIColor(named: "Light")!
    }

    static var medium:UIColor {
        return UIColor(named: "Medium")!
    }

    static var primary: UIColor {
        return UIColor(named: "Primary")!
    }

    static var primary_30: UIColor {
        return UIColor(named: "Primary_30")!
    }

    static var primary_shade: UIColor {
        return UIColor(named: "Primary_shade")!
    }

    static var primary_tint: UIColor {
        return UIColor(named: "Primary_tint")!
    }

    static var secondary: UIColor {
        return UIColor(named: "Secondary")!
    }

    static var secondary_30: UIColor {
        return UIColor(named: "Secondary_30")!
    }

    static var secondary_shade: UIColor {
        return UIColor(named: "Secondary_shade")!
    }

    static var secondary_tint: UIColor {
        return UIColor(named: "Secondary_tint")!
    }

    static var tetriary: UIColor {
        return UIColor(named: "Tetriary")!
    }

    static var tetriary_30: UIColor {
        return UIColor(named: "Tetriary_30")!
    }

    static var tetriary_shade: UIColor {
        return UIColor(named: "Tetriary_shade")!
    }

    static var tetriary_tint: UIColor {
        return UIColor(named: "Tetriary_tint")!
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
         return self.modifier(Heading2())
    }
}

extension Text {
    func pincodeFont() -> Text {
         return self.font(Font.custom("Roboto-Bold", size: 56))
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
         return self.modifier(Heading1())
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
         return self.modifier(Paragraph())
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
         return self.modifier(ParagraphBold())
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
         return self.modifier(Small())
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
         return self.modifier(SmallBold())
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
         return self.modifier(Tiny())
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
         return self.modifier(TinyBold())
    }
}
