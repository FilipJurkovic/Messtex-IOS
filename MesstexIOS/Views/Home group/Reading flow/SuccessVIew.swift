//
//  SuccessVIew.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 26.07.2021..
//

import SwiftUI

struct SuccessVIew: View {
    
    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing:0){
                Image("successful_read")
                .resizable()
                .frame(width: 205, height: 171)
                .padding(EdgeInsets(top: 105, leading: 0, bottom: 32, trailing: 0))

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
                NavigationLink(
                            destination: AboutUsView(),
                            label : {
                                OutlinedButtonStyle(buttonLabel: "LearnMore")
                            })
                    .padding(.bottom, 210)
                Button(
                    action: {
                        viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
                        self.presentationMode.wrappedValue.dismiss()
                    } ,
                            label : {
                                PrimaryButtonStyle(buttonLabel: "Next")
                            }).padding(.bottom, 30)
                
                NavigationLink(destination: ConfirmationView(viewModel: viewModel), tag: ReadingFlowEnum.homeView, selection: $viewModel.currentReadingView) { EmptyView() }
                   
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

