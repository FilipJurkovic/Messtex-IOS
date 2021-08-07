//
//  HomeView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var viewModel : MainViewModel

    var faq_home = Faq(
        faqs:[
            FaqItem(sortNumber: 0, question: "Where can I find my electricity meter?", answer: "You can usually find the water meters in your apartment in the kitchen, bathroom and / or toilet."),
            FaqItem(sortNumber: 1, question: "Where can I find my cold water meter?", answer: "You can usually find the water meters in your apartment in the kitchen, bathroom and / or toilet."),
            FaqItem(sortNumber: 2, question: "Where can I find my RMVs?", answer: "You can usually find the RMWs in your apartment.")
        ]
    )

    @State  var flags: [Bool] = [false, false, false]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Group {
                    ZStack(alignment:.bottom) {
                        Image("home_top")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width)
                            .offset(y: -100)
                            .padding(.bottom, -40)
                        Image("logo_start")
                            .resizable()
                            .frame(width: 142, height: 142)
                    }.padding(.bottom, 10)

                    Text(LocalizedStringKey("Title"))
                        .heading2()
                        .foregroundColor(.dark)
                        .padding(.bottom, 25)

                    Text(LocalizedStringKey("Subtitle"))
                        .paragraphBold()
                        .foregroundColor(.primary_color)
                        .multilineTextAlignment(.center)
                        .padding(!viewModel.isReadingFinished ? EdgeInsets(top: 0, leading: 0, bottom: 83, trailing: 0) :
                                    EdgeInsets(top: 0, leading: 0, bottom: 41, trailing: 0))
                    if !viewModel.isReadingFinished {
                        NavigationLink(
                            destination: MeterReadingFlowView(viewModel: viewModel),
                            label : {
                                PrimaryButtonStyle(buttonLabel: "ReadingButton")
                            })
                    }
                    else {
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
                    .padding(.bottom, 30)

                Image("tips_graphics")
                    .padding(.bottom, 30)

                Text(LocalizedStringKey("TipsSubtitle"))
                    .heading2()
                    .foregroundColor(.primary_color)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 38)

                FaqWidget(questionCount: faq_home.faqs.count, flags: $flags, faq: faq_home)
                    .padding(.bottom, 21)

                NavigationLink(
                    destination: FaqView(viewModel: viewModel),
                    label : {
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
                    label : {
                        OutlinedButtonStyle(buttonLabel: "ShareButton")
                    })
            }
            .padding(.bottom, 140)

            Image("logo")
                .frame(width: 102, height: 66)
                .padding(.bottom, 154)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainViewModel())
    }
}
