//
//  HomeView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var viewModel: MainViewModel

    var faq_home_en = Faq(faqs: [
                        FaqItem(sortNumber: 0, question: "When do I have to read the meters?", answer: "The meter readings currently have to be done once a year. We will inform you in advance when it is due again. Afterwards, you will have a time period of 2 weeks for entering your meter readings."),
                        FaqItem(sortNumber: 1, question: "Why should I use the Messtex app?", answer: "The Messtex app helps you enter meter readings quickly, conveniently, as well as cost- and time-efficiently from home without the necessity of waiting for a service technician. "),
                        FaqItem(sortNumber: 2, question: "Why do I need to read my meter?", answer: "Your meter reading is used to determine your annual consumption. If you provide us with your actual meter reading, you will receive a fair and comprehensible bill. If you do not report your meter reading, it will be estimated. Then your bill will differ from your actual consumption in any case.")])
    
    var faq_home_de = Faq(faqs: [
                        FaqItem(sortNumber: 0, question: "Wann muss ich die Zähler ablesen?", answer: "Die Zählerstände müssen aktuell einmal im Jahr abgelesen werden. Wir informieren Sie rechtzeitig, wenn es wieder soweit ist. Sie haben dann einen Zeitraum von 2 Wochen, in dem Sie Ihre Zählerstände eintragen können."),
                        FaqItem(sortNumber: 1, question: "Warum mit der Messtex App ablesen?", answer: "Die Messtex-App hilft Ihnen die Zählerstände schnell, bequem, kostensparend und zeiteffizient von Zuhause aus einzutragen. "),
                        FaqItem(sortNumber: 2, question: "Warum muss ich meinen Zählerstand ablesen?", answer: "Mit Ihrem Zählerstand wird Ihr Jahresverbrauch ermittelt. Wenn Sie uns Ihren tatsächlichen Zählerstand mitteilen, erhalten Sie eine faire und nachvollziehbare Abrechnung. Sollten Sie Ihren Zählerstand nicht melden, wird er geschätzt. Dann wird Ihre Rechnung in jedem Fall von Ihrem tatsächlichen Verbrauch abweichen.")])

    @State  var flags: [Bool] = [false, false, false]

    var body: some View {
        ZStack {
        ScrollView(showsIndicators: false) {
            VStack {
                Group {
                    ZStack(alignment: .bottom) {
                        Image("home_top")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width)
                            .offset(y: -50)
                            .padding(.bottom, 15)
                        Image("logo_start")
                            .resizable()
                            .frame(width: 142, height: 142)
                    }.padding(.bottom, 10)

                    Text(LocalizedStringKey("Title"))
                        .heading2()
                        .foregroundColor(.dark)
                        .padding(.bottom, 16)

                    Text(LocalizedStringKey("Subtitle"))
                        .paragraphBold()
                        .foregroundColor(.primary_color)
                        .multilineTextAlignment(.center)
                        .padding(!viewModel.isReadingFinished ? EdgeInsets(top: 0, leading: 60, bottom: 83, trailing: 60) :
                                    EdgeInsets(top: 0, leading: 60, bottom: 41, trailing: 60))
                    if !viewModel.isReadingFinished {
                        Button(
                            action: {viewModel.dismissReadingFlow.toggle()},
                            label: {
                                PrimaryButtonStyle(buttonLabel: "ReadingButton")
                            })
                    } else {
                        FinishedReadingWidget()
                    }

                }

            }
            .padding(!viewModel.isReadingFinished ? EdgeInsets(top: 0, leading: 0, bottom: 208, trailing: 0) :
                        EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0))

            Co2Widget(co2Level: viewModel.co2Level.co2Level)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .padding(.bottom, 45)

            VStack {
                Text(LocalizedStringKey("TipsTitle"))
                    .heading2()
                    .foregroundColor(.dark)
                    .padding(.bottom, 31)

                Image("tips_graphics")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 174)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(.bottom, 28)
                    .padding(.horizontal, 24)

                Text(LocalizedStringKey("TipsSubtitle"))
                    .heading2()
                    .foregroundColor(.primary_color)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 36)
                    .padding(.horizontal, 56)

                HStack {
                    NavigationLink(
                        destination: WaterTipView(),
                        label: {
                            TipsCard(title: "WaterTip", icon: "water_tip")
                        })

                    Spacer()
                    NavigationLink(
                        destination: HeatTipView(),
                        label: {
                            TipsCard(title: "HeatTip", icon: "heat_tip", iconWidth: 33)
                        })

                    Spacer()
                    NavigationLink(
                        destination: EnvironmentTipView(),
                        label: {
                            TipsCard(title: "EnvironmentTip", icon: "environment_tip", iconWidth: 44, iconHeight: 51)
                        })

                }.padding(.horizontal, 24)
                .padding(.bottom, 33)

                FaqWidget(questionCount: faq_home_en.faqs.count, flags: $flags, faq: viewModel.language == "English" ? faq_home_en : faq_home_de)
                    .padding(.bottom, 25)

                NavigationLink(
                    destination: FaqView(viewModel: viewModel),
                    label: {
                        OutlinedButtonStyle(buttonLabel: "ShowMore")
                    })
            }
            .padding(.bottom, 154)

            VStack {
                Text(LocalizedStringKey("ContactTitle"))
                    .heading2()
                    .foregroundColor(.dark)
                    .padding(.bottom, 27)

                Image("contact_graphics")
                    .frame(width: 199, height: 167)
                    .padding(.bottom, 20)

                NavigationLink(
                    destination: ContactFormView(viewModel: viewModel),
                    label: {
                        OutlinedButtonStyle(buttonLabel: "ContactButton")
                    })
            }
            .padding(.bottom, 140)

            Image("logo")
                .frame(width: 102, height: 66)
                .padding(.bottom, 154)

            NavigationLink(destination: AboutUsView(), isActive: $viewModel.showAboutPage, label: { EmptyView() })

        }
        }.onAppear {
            UITabBar.appearance().isHidden = false
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainViewModel())
    }
}
