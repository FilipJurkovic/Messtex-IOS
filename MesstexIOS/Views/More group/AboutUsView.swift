//
//  AboutUsView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct AboutUsView: View {
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
                            Text(LocalizedStringKey("About"))
                                .heading2()
                                .foregroundColor(.primary_color).padding(.vertical, 12)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 24)

                    Image("about_top")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width)
                    VStack(alignment: .leading) {
                        Group {
                            Text(LocalizedStringKey("AboutTitle"))
                                .heading2()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 16)

                            Text(LocalizedStringKey("AboutParagraphOne"))
                                .paragraph()
                                .padding(.bottom, 23)

                            Text(LocalizedStringKey("AboutSubtitleOne"))
                                .paragraphBold()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 16)

                            VStack {
                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("AboutBulletpointOne"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }
                                .padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("AboutBulletpointTwo"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("AboutBulletpointThree"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("AboutBulletpointFour"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)

                                HStack(alignment: .top) {
                                    Image("bullet_point")
                                        .padding(.trailing, 17)
                                    Text(LocalizedStringKey("AboutBulletpointFive"))
                                        .paragraph()
                                        .fixedSize(horizontal: false, vertical: true)
                                    Spacer()
                                }.padding(.bottom, 22)

                            }.lineLimit(10)

                            Text(LocalizedStringKey("AboutParagraphTwo"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 65)
                        }

                        Spacer()
                    }
                    .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                    ZStack {
                        Rectangle()
                            .foregroundColor(.primary_color)
                        Text(LocalizedStringKey("AboutCardText"))
                            .heading1()
                            .foregroundColor(.light)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 33.5)

                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 250, alignment: .center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 40)

                    VStack(alignment: .leading) {
                        Text(LocalizedStringKey("AboutPrinciplesTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text(LocalizedStringKey("AboutPrinciplesParagraph"))
                            .paragraph()
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 42)

                        Group {
                            StepIndicator(stepIndex: 1)
                                .padding(.bottom, 7)
                            Text(LocalizedStringKey("AboutPrinciplesSubtitleOne"))
                                .paragraphBold()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 5)
                            Text(LocalizedStringKey("AboutPrinciplesParagraphOne"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 42)

                            StepIndicator(stepIndex: 2)
                                .padding(.bottom, 7)
                            Text(LocalizedStringKey("AboutPrinciplesSubtitleTwo"))
                                .paragraphBold()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 5)
                            Text(LocalizedStringKey("AboutPrinciplesParagraphTwo"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 42)

                            StepIndicator(stepIndex: 3)
                                .padding(.bottom, 7)
                            Text(LocalizedStringKey("AboutPrinciplesSubtitleThree"))
                                .paragraphBold()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 5)
                            Text(LocalizedStringKey("AboutPrinciplesParagraphThree"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 42)
                        }
                    }
                    .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
                    .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
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

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
