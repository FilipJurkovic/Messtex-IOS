//
//  PrivacyView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct EnvironmentTipView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        RoundButtonStyle(imageName: "arrow.left", backgroundColor: Color.light, iconColor: Color.dark)
    }
    }

    var body: some View {
        ZStack(alignment: .top) {

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ZStack {
                        HStack {
                            Spacer()
                            Text(LocalizedStringKey("TipsTitle"))
                                .heading2()
                                .foregroundColor(.primary_color).padding(.vertical, 12)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 24)

                    Image("environment")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width)
                    VStack(alignment: .leading, spacing: 0) {
                        Group {
                            Text(LocalizedStringKey("EnvironmentTipTitle"))
                                .heading1()
                                .foregroundColor(.primary_color)

                            Text(LocalizedStringKey("EnvironmentTipReadingTime"))
                                .heading3()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 16)

                            Text(LocalizedStringKey("EnvironmentTipParagraphOne"))
                                .paragraph()
                                .padding(.bottom, 16)
                                .fixedSize(horizontal: false, vertical: true)

                            Text(LocalizedStringKey("EnvironmentTipParagraphTwo"))
                                .paragraph()
                                .padding(.bottom, 23)
                                .fixedSize(horizontal: false, vertical: true)

                            VStack {
                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("EnvironmentTipParagraphThree"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }
                                .padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("EnvironmentTipParagraphFour"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("EnvironmentTipParagraphFive"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)
                            }
                        }

                        Spacer()
                    }
                    .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                }
            }

            HStack {
                btnBack
                    .padding(.leading, 7)

                Spacer()
            }
        }

    }
}

struct EnvironmentTipView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentTipView()
    }
}
