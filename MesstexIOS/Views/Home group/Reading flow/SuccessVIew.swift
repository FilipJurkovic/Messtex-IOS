//
//  SuccessVIew.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 26.07.2021..
//

import SwiftUI

struct SuccessVIew: View {
    
    @ObservedObject var viewModel : MainViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing:0){
                Image("successful_read")
                .resizable()
                .frame(width: 205, height: 171)
                .padding(EdgeInsets(top: 62, leading: 0, bottom: 32, trailing: 0))

                Text(LocalizedStringKey("SuccessTitle"))
                  .heading1()
                  .foregroundColor(.primary_color)
                  .multilineTextAlignment(.center)
                  .padding(.bottom, 15)
          
                Text(LocalizedStringKey("SuccessSubtitle \(viewModel.userData.firstName)"))
                    .paragraph()
                    .foregroundColor(.dark)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 65)
                    .padding(.horizontal, 20)
                
                Co2Widget(co2Level: viewModel.co2Level.co2Level)
                .padding(.bottom, 19)
                Button(
                    action: {
                        viewModel.isReadingFinished.toggle()
                        viewModel.dismissReadingFlow.toggle()
                        viewModel.showAboutPage.toggle()
                        viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
                    },
                    label : {
                        OutlinedButtonStyle(buttonLabel: "LearnMore")
                    })
                    .padding(.bottom, 210)
                
                PrimaryButton(handler: {
                    viewModel.isReadingFinished.toggle()
                    viewModel.dismissReadingFlow.toggle()
                    viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
                }, buttonLabel: "Next")
                .padding(.bottom, 30)
                .padding(.horizontal, 24)
                   
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .frame(height: UIScreen.main.bounds.size.height)
    }
}

struct SuccessVIew_Previews: PreviewProvider {
    static var previews: some View {
        SuccessVIew(viewModel: MainViewModel())
    }
}

