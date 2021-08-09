//
//  CodeReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI
import UIKit

public struct CodeReadingView: View {

    @ObservedObject var viewModel: MainViewModel

    var maxDigits: Int = 6
    var label = "Enter One Time Password"

    @State var pin: String = ""
    @State var showPin = false
    @State var isDisabled = false

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    public var body: some View {

        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ReadingFlowHeaderWidget(title: "CodeReadingTitle", description: "CodeReadingSubtitle")
                        .padding(.bottom, 35)

                    ZStack {
                        pinDots
                        backgroundField
                    }
                    .padding(.bottom, viewModel.verificationError.message != "" ? 11 : 54)
                    .padding(.horizontal, 15)

                    if viewModel.verificationError.message != ""{
                        Text(viewModel.verificationError.message)
                            .paragraph()
                            .foregroundColor(.danger)
                            .padding(.bottom, 22.7)
                    }

                    ZStack(alignment: .topTrailing) {
                        VStack {
                            Spacer()
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.tetriary_30, lineWidth: 1)
                                    Image("example_brief")
                                        .resizable()
                                        .frame(width: 132, height: 186)
                                }.frame(width: 172, height: 215)
                                Spacer()
                            }
                        }

                        NavigationLink(
                            destination: ExampleView(),
                            label: {
                                RoundButtonStyle(imageName: "magnifyingglass", backgroundColor: .primary_color, iconColor: .light)
                            }).offset(x: 10)
                    }.frame(width: 178.31, height: 236.31)
                    .padding(.bottom, 38)

                    NavigationLink(
                        destination: Text(pin),
                        label: {
                            Text(LocalizedStringKey("Link"))
                                .underline()
                                .paragraph()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 47)
                        })
                    Button(action: { viewModel.getUtilizationUnitData(pin: pin) }, label: {
                        PrimaryButtonStyle(buttonLabel: "Next")
                    })

                }
                .ignoresSafeArea()
                .navigationTitle("")
                .navigationBarHidden(true)

            }

        }

    }

    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                if index >= self.pin.count {
                    RoundedRectangle(cornerRadius: 12.8)
                        .stroke(viewModel.verificationError.message.isEmpty ? Color.primary_shade : Color.danger, lineWidth: 1.6)
                        .frame(width: 52, height: 70)
                } else {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 12.8)
                            .stroke(viewModel.verificationError.message.isEmpty ? Color.primary_shade : Color.danger, lineWidth: 1.6)

                        Text(self.pin[String.Index(encodedOffset: index)...String.Index(encodedOffset: index)])
                            .font(Font.custom("Roboto-Bold", size: 56))
                            .foregroundColor(.primary_color)
                    }.frame(width: 52, height: 70)}
                Spacer()
            }
        }
    }

    private var backgroundField: some View {
        TextField("", text: $pin, onCommit: { print(pin) })
            .accentColor(.clear)
            .foregroundColor(.clear)
            .frame(height: 70)
            .onChange(of: pin, perform: { value in
                if value.count > 6 {
                    pin.popLast()
                }
            })

    }

}
struct CodeReadingView_Previews: PreviewProvider {
    static var previews: some View {
        CodeReadingView(viewModel: MainViewModel())
    }
}
