//
//  PrivacyView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct HeatTipView: View {
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

                    Image("heating_tip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width)
                    VStack(alignment: .leading, spacing: 0) {
                        Group {
                            Text(LocalizedStringKey("HeaterTipTitle"))
                                .heading1()
                                .foregroundColor(.primary_color)

                            Text(LocalizedStringKey("HeaterTipReadingTime"))
                                .heading3()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 16)

                            Text(LocalizedStringKey("HeaterTipParagraph"))
                                .paragraph()
                                .padding(.bottom, 33)
                                .fixedSize(horizontal: false, vertical: true)

                            Group {
                                StepIndicator(stepIndex: 1)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointOneTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointOne"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 2)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointTwoTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointTwo"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                Group {StepIndicator(stepIndex: 3)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointThreeTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointThree"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 4)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointFourTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointFour"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 5)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointFiveTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 7)
                                    VStack(alignment: .leading) {
                                                           HStack(alignment: .top) {
                                                               Text("a.")
                                                                   .paragraphBold()
                                                                .foregroundColor(.primary_color)
                                                                .padding(.trailing, 7)
                                                               Text(LocalizedStringKey("HeaterTipBuletpointFiveA"))
                                                                   .paragraph()
                                                           }.padding(.bottom, 5)

                                                           HStack(alignment: .top) {
                                                               Text("b.")
                                                                   .paragraphBold()
                                                                .foregroundColor(.primary_color)
                                                                .padding(.trailing, 7)
                                                               Text(LocalizedStringKey("HeaterTipBuletpointFiveB"))
                                                                   .paragraph()
                                                           }

                                    }.padding(.leading, 5)
                                    .padding(.bottom, 24)

                                }
                            }
                            Group {

                                StepIndicator(stepIndex: 6)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointSixTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointSix"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 7)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("HeaterTipBuletpointSevenTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("HeaterTipBuletpointSeven"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

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

struct HeatTipView_Previews: PreviewProvider {
    static var previews: some View {
        HeatTipView()
    }
}
