//
//  AboutUsView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct AboutUsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "arrow.backward")
                    .font(.body)
                    .foregroundColor(.dark)
                    .padding()
            }
        })
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            Image("about_top")
                .resizable()
                .frame(width:UIScreen.main.bounds.size.width)
            VStack(alignment:.leading) {
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
                        HStack {
                            Image("bullet_point")
                                .padding(.trailing, 17)
                            Text(LocalizedStringKey("AboutBulletpointOne"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        .padding(.bottom, 22)

                        HStack {
                            Image("bullet_point")
                                .padding(.trailing, 17)
                            Text(LocalizedStringKey("AboutBulletpointTwo"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }.padding(.bottom, 22)

                        HStack {
                            Image("bullet_point")
                                .padding(.trailing, 17)
                            Text(LocalizedStringKey("AboutBulletpointThree"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }.padding(.bottom, 22)

                        HStack {
                            Image("bullet_point")
                                .padding(.trailing, 17)
                            Text(LocalizedStringKey("AboutBulletpointFour"))
                                .paragraph()
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }.padding(.bottom, 22)

                        HStack {
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
                        .padding(.bottom, 65)
                }

                Spacer()
            }
            .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(LocalizedStringKey("About"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                        .foregroundColor(.dark)
                }
            }

            ZStack {
                Rectangle()
                    .foregroundColor(.primary_color)
                Text(LocalizedStringKey("AboutCardText"))
                    .heading1()
                    .foregroundColor(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 33.5)

            }
            .frame(width: UIScreen.main.bounds.size.width, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 66)

            VStack(alignment:.leading) {
                Text(LocalizedStringKey("AboutPrinciplesTitle"))
                    .heading2()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 16)

                Text(LocalizedStringKey("AboutPrinciplesParagraph"))
                    .paragraph()
                    .padding(.bottom, 23)
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
                        .padding(.bottom, 32)

                    StepIndicator(stepIndex: 2)
                        .padding(.bottom, 7)
                    Text(LocalizedStringKey("AboutPrinciplesSubtitleTwo"))
                        .paragraphBold()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 5)
                    Text(LocalizedStringKey("AboutPrinciplesParagraphTwo"))
                        .paragraph()
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 32)

                    StepIndicator(stepIndex: 3)
                        .padding(.bottom, 7)
                    Text(LocalizedStringKey("AboutPrinciplesSubtitleThree"))
                        .paragraphBold()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 5)
                    Text(LocalizedStringKey("AboutPrinciplesParagraphThree"))
                        .paragraph()
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
