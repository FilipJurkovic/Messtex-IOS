//
//  UIComponents.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 25/05/2021.
//

import Foundation
import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 50)
            .frame(width: 100, height: 100)
    }
}

struct CardButton: View {
    var cardName: String
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Rectangle()
            HStack(alignment: .top) {
                Text(LocalizedStringKey(cardName))
                    .foregroundColor(.dark)
                    .padding(.leading, 12)
                    .padding(.top, 5)
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 7.38, height: 12.92)
                    .foregroundColor(.dark)
                    .padding()
            }
        }.frame(width: 351, height: 54)
        .foregroundColor(.light)

    }
}

struct FloatingTextField: View {
    let textFieldHeight: CGFloat = 57
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    var error: Bool = false
    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(self.error ? Color.danger : text.count != 0 ? Color.dark : Color.medium, lineWidth: 1)
                .frame(height: textFieldHeight)

            TextField("", text: $text, onEditingChanged: { (edit) in
                isEditing = edit
            })

            .paragraph()
            .offset(x: 15)
            .foregroundColor(self.error ? Color.danger : Color.dark)
            .accentColor(Color.medium)
            .animation(.linear)
            .offset(y: 8)

            // Floating Placeholder
            Text(LocalizedStringKey(placeHolderText))
                .paragraph()
                .foregroundColor(Color.medium)
                .background(Color(UIColor.systemBackground))
                .offset(x: 15.0, y: -17)
                .scaleEffect(shouldPlaceHolderMove ? 0.857 : 1.0)
                .animation(.linear)

        }
    }
}

struct FloatingNumericTextField: View {
    let textFieldHeight: CGFloat = 57
    private let placeHolderText: String
    @Binding var text: Int
    @State private var isEditing = false
    var error: Bool = false
    public init(placeHolder: String,
                text: Binding<Int>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        isEditing || (String(text).count != 0)
    }
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(self.error ? Color.danger : String(text).count != 0 ? Color.dark : Color.medium, lineWidth: 1)
                .frame(height: textFieldHeight)

            TextField("", value: $text, formatter: NumberFormatter(), onEditingChanged: { (edit) in
                isEditing = edit
            })
            .paragraph()
            .offset(x: 15)
            .foregroundColor(self.error ? Color.danger : Color.dark)
            .accentColor(Color.medium)
            .animation(.linear)
            .offset(y: 8)

            // Floating Placeholder
            Text(LocalizedStringKey(placeHolderText))
                .paragraph()
                .foregroundColor(Color.medium)
                .background(Color(UIColor.systemBackground))
                .offset(x: 15.0, y: -17)
                .scaleEffect(shouldPlaceHolderMove ? 0.857 : 1.0)
                .animation(.linear)

        }
    }
}

struct FloatingTextEditor: View {
    let textFieldHeight: CGFloat = 168
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    var error: Bool = false
    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        text.count != 0
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 4)
                .stroke(self.error ? Color.danger : text.count != 0 ? Color.dark : Color.medium, lineWidth: 1)
            TextEditor(text: $text)
                .offset(x: 13, y: 21)
                .padding(.init(top: 0, leading: 0, bottom: 25, trailing: 20))
                .frame(height: textFieldHeight)
                .paragraph()
                .background(Color.light.opacity(0.0))
                .animation(.linear)

            Text(LocalizedStringKey(placeHolderText))
                .paragraph()
                .foregroundColor(Color.medium)
                .background(Color(UIColor.systemBackground))
                .offset(x: 15.0, y: shouldPlaceHolderMove ? 9 : 16)
                .scaleEffect(shouldPlaceHolderMove ? 0.857 : 1.0)
                .animation(.linear)
        }
    }
}

struct PrimaryButton: View {
    var handler: () -> Void
    var buttonLabel: String
    var isEnabled: Bool = true

    var body: some View {
        Button(action: handler, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 28)
                    .foregroundColor(.primary_color)
                    .opacity(isEnabled ? 1.0 : 0.3)
                Text(buttonLabel)
                    .paragraphBold()
                    .foregroundColor(.light)

            }.frame(width: 327, height: 49, alignment: .center)
        })
        .disabled(!isEnabled)

    }
}

struct PrimaryButtonStyle: View {
    var buttonLabel: String
    var isEnabled: Bool = true

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .foregroundColor(.primary_color)
                .opacity(isEnabled ? 1.0 : 0.3)
            Text(LocalizedStringKey(buttonLabel))
                .paragraphBold()
                .foregroundColor(.light)

        }.frame(width: 327, height: 49, alignment: .center)
    }
}

struct ManualReadingButtonStyle: View {

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .foregroundColor(.primary_color)
                .opacity(0.3)
            HStack {
                Text(LocalizedStringKey("ManualButton"))
                    .paragraphBold()
                    .foregroundColor(.light)
                    .padding(.trailing, 13)

                Image("manual_scan_icon")
                    .resizable()
                    .frame(width: 16.25, height: 12.51)
            }

        }.frame(width: 289, height: 60, alignment: .center)
    }
}
struct OutlinedButtonStyle: View {
    var buttonLabel: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary_tint, lineWidth: 1.6)
            Text(LocalizedStringKey(buttonLabel))
                .tinyBold()
                .foregroundColor(.primary_tint)
        }.frame(width: 142, height: 34, alignment: .center)
    }
}

struct SubmitButtonStyle: View {
    var body: some View {
        ZStack {ZStack {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.primary_shade, lineWidth: 2)
            Text(LocalizedStringKey("Submit"))
                .tinyBold()
                .foregroundColor(.primary_shade)
        }.frame(width: 76, height: 34)

        }
    }
}

struct ChangeButtonStyle: View {
    var body: some View {
        ZStack {ZStack {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(.secondary)
            Text(LocalizedStringKey("Change"))
                .tinyBold()
                .foregroundColor(.light)
        }.frame(width: 76, height: 34)

        }
    }
}

struct StepIndicator: View {
    var stepIndex: Int
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(Color.primary_shade, lineWidth: 2)
                .frame(width: 36, height: 36)
            Text(String(stepIndex))
                .paragraphBold()
        }.padding(.trailing, 17)
    }
}

struct RoundButtonStyle: View {
    var imageName: String
    var backgroundColor: Color
    var iconColor: Color

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(backgroundColor)
            Image(systemName: imageName)
                .font(.body)
                .foregroundColor(iconColor)
                .padding()
        }
    }
}

struct LargeRoundButtonStyle: View {
    var imageName: String
    var backgroundColor: Color
    var iconColor: Color

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(backgroundColor)
            Image(systemName: imageName)
                .font(.body)
                .foregroundColor(iconColor)
                .padding()
        }
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}

struct RadioButton: View {

    @Environment(\.colorScheme) var colorScheme

    let id: String
    let callback: (String) -> Void
    let selectedID: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat

    init(
        _ id: String,
        callback: @escaping (String) -> Void,
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary_color,
        textSize: CGFloat = 14
    ) {
        self.id = id
        self.size = size
        self.color = color
        self.textSize = 14
        self.selectedID = selectedID
        self.callback = callback
    }

    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                self.callback(self.id)
            }, label: {
                if self.selectedID == self.id {
                    selected
                } else {
                    unSelected
                }
            })
            Text(LocalizedStringKey(id))
                .paragraph()
                .foregroundColor(.dark)

            Spacer()
        }.padding(.horizontal, 14)

    }

    private var selected : some View {
        ZStack {
            Circle()
                .stroke(Color.dark, lineWidth: 1)

            Circle()
                .foregroundColor(.primary_color)
                .frame(width: 14, height: 14)
        }.frame(width: 24, height: 24)
    }

    private var unSelected : some View {

        Circle()
            .stroke(Color.dark, lineWidth: 1)
            .frame(width: 24, height: 24)

    }
}

struct RadioButtonGroup: View {

    let items: [String]

    @State var selectedId: String = ""

    let callback: (String) -> Void

    var body: some View {
        VStack {
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
                    .padding(.vertical, 20)
                if index != items.count-1 {
                    Divider()
                        .foregroundColor(.tetriary)
                        .padding(.horizontal, 10)
                        .frame(height: 1)
                }
            }
        }
    }

    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

struct Loader: View {

    @State var animate = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 26)
                .foregroundColor(.light)
            VStack {
                Spacer()

                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Color.primary_color, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .frame(width: 45, height: 45)
                    .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                    .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                    .padding(.bottom, 20)

                Text(LocalizedStringKey("Loader"))
                    .paragraph()

                Spacer()
            }
        }.frame(width: 250, height: 180)
        .onAppear {
            self.animate.toggle()
        }
    }

}

struct FinishedReadingWidget: View {

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.primary_color)
                HStack {
                    Image("successful_read")
                        .resizable()
                        .frame(width: 61, height: 78)
                        .padding(.trailing, 29)
                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("SuccessCardTitle"))
                            .heading2()
                            .foregroundColor(.light)
                            .padding(.bottom, 5)
                        Text(LocalizedStringKey("SuccessCardSubtitle"))
                            .paragraph()
                            .foregroundColor(.light)
                    }
                }
            }
            .frame(width: 319, height: 138)

            NavigationLink(
                destination: AboutUsView(),
                label: {
                    OutlinedButtonStyle(buttonLabel: "MoreButton")
                })
        }
    }
}

struct Co2Widget: View {
    var co2Level: Double
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.primary_color)
                VStack {
                    Text(LocalizedStringKey("Co2Title"))
                        .heading2()
                        .foregroundColor(.light)
                        .padding(.bottom, 13)
                        .multilineTextAlignment(.center)
                    Text(String(co2Level))
                        .font(Font.custom("Roboto-Bold", size: 56))
                        .foregroundColor(.light)
                        .padding(.bottom, 16)

                    Text(LocalizedStringKey("Co2Subtitle"))
                        .paragraph()
                        .foregroundColor(.light)
                        .padding(.bottom, 34)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                }.frame(alignment: .bottom)
            }.frame(height: 267)
            Image("earth_illustration")
                .resizable()
                .frame(width: 101, height: 122, alignment: .top)
                .padding(.bottom, 219)

        }.frame(width: UIScreen.main.bounds.size.width, height: 341)
    }
}

struct FaqWidget: View {

    var questionCount: Int
    @Binding var flags: [Bool]
    var faq: Faq

    var body: some View {
        VStack {
            ForEach(0..<questionCount) { index in
                DisclosureGroup(
                    isExpanded: $flags[index],
                    content: {
                        Text(faq.faqs[index].answer)
                            .paragraph()

                    },
                    label: {
                        if flags[index] {
                            Text(faq.faqs[index].question)
                                .paragraphBold()
                        } else {
                            Text(faq.faqs[index].question)
                                .paragraph()
                        }
                    }
                )
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .accentColor(.dark)
                .onTapGesture {
                    withAnimation(.easeOut, {flags[index].toggle()})
                }
                .animation(.easeIn)

                if index != flags.count-1 {
                    Divider()
                        .frame(height: 3)
                        .foregroundColor(.medium)
                }
            }
            // Spacer()
        }.padding(.horizontal, 26)
    }
}

struct ReadingFlowHeaderWidget: View {

    var title: String
    var description: String
    var body: some View {
        VStack {
            Image("reading_graphics")
                .resizable()
                .frame(width: 114, height: 95)

            Text(LocalizedStringKey(title))
                .heading1()
                .foregroundColor(.primary_color)
                .padding(.bottom, 25)

            Text(LocalizedStringKey(description))
                .paragraphBold()
                .foregroundColor(.dark)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
        }
    }
}

struct AboutUsCardWidget: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.light)
                .shadow(color: .tetriary, radius: 2, x: 2, y: 3)
            HStack {
                Image("faq_card_image")
                    .alignmentGuide(.leading, computeValue: { dimension in
                        dimension[.leading]
                    })
                    .padding(.trailing)
                VStack(alignment: .leading) {
                    Text(LocalizedStringKey("AboutCardTitle"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .alignmentGuide(.top, computeValue: { dimension in
                            dimension[.top]
                        })
                        .padding(.init(top: 17, leading: 0, bottom: 8, trailing: 0))
                    Text(LocalizedStringKey("AboutCardSubtitle"))
                        .paragraph()
                        .alignmentGuide(.top, computeValue: { dimension in
                            dimension[.top]

                        })
                    Spacer()
                }
                Spacer()
            }
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .foregroundColor(.light.opacity(0.0))
                NavigationLink(
                    destination: AboutUsView(),
                    label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.primary_color)
                                    .frame(width: 40, height: 40)
                                    .shadow(radius: 2)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.light)

                            }}
                    })
                    .padding(.init(top: 0, leading: 0, bottom: 19, trailing: 19))
            }.frame(width: 327, height: 176)

        }.frame(width: 327, height: 176)
    }
}

// struct FinishedReadingWidget : View {
//
//    var body: some View{
//
//    }
// }
