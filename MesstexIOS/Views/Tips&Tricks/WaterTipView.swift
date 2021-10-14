//
//  PrivacyView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct WaterTipView: View {
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

                    Image("water_tip_top")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width)
                    VStack(alignment: .leading, spacing: 0) {
                        Group {
                            Text(LocalizedStringKey("WaterTipTitle"))
                                .heading1()
                                .foregroundColor(.primary_color)

                            Text(LocalizedStringKey("WaterTipReadingTime"))
                                .heading3()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 16)

                            Text(LocalizedStringKey("WaterTipParagraph"))
                                .paragraph()
                                .padding(.bottom, 33)
                                .fixedSize(horizontal: false, vertical: true)

                            Text(LocalizedStringKey("WaterTipSubtitleOne"))
                                .heading2()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 21)

                            Group {
                                StepIndicator(stepIndex: 1)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointOneOneTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointOneOne"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 2)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointOneTwoTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointOneTwo"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                Group {StepIndicator(stepIndex: 3)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointOneThreeTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointOneThree"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 4)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointOneFourTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointOneFour"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 5)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointOneFiveTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointOneFive"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 33)}
                            }
                            Group {
                            Text(LocalizedStringKey("WaterTipSubtitleTwo"))
                                .heading2()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 21)

                                StepIndicator(stepIndex: 1)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoOneTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoOne"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 2)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoTwoTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoTwo"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 3)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoThreeTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointTwoThree"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                }

                            Group {
                            Text(LocalizedStringKey("WaterTipSubtitleThree"))
                                .heading2()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 21)

                                StepIndicator(stepIndex: 1)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointThreeOneTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointThreeOne"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                StepIndicator(stepIndex: 2)
                                    .padding(.bottom, 7)
                                Text(LocalizedStringKey("WaterTipBuletpointThreeTwoTitle"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.bottom, 5)
                                Text(LocalizedStringKey("WaterTipBuletpointThreeTwo"))
                                    .paragraph()
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 24)

                                }
                        }

                        Text(LocalizedStringKey("WaterTipParagraphTwo"))
                                            .paragraph()
                                            .padding(.bottom, 50)

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

struct WaterTipView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTipView()
    }
}
