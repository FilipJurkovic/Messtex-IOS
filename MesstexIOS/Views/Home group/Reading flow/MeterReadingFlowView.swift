//
//  MeterReadingFlowView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 02.08.2021..
//

import SwiftUI

struct MeterReadingFlowView: View {
    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack(alignment: .topLeading){

            switch viewModel.currentReadingView{
                case .codeReadingView :
                    CodeReadingView(viewModel: viewModel)
                        .transition(.opacity)
                    
                case .readingStepsView :
                    ReadingStepsView(viewModel: viewModel)
                        .transition(.opacity)

                case .meterReadingView :
                    MeterReadingView(cameraView: CameraView(captureAction: { image, values in

                            viewModel.postModelData.meterReadings[viewModel.currentMeterIndex].counterValue = viewModel.removePoint(value: values[0])

                            viewModel.currentReadingView = ReadingFlowEnum.manualReadingView
                        }), index: viewModel.currentMeterIndex, viewModel: viewModel)
                    .transition(.opacity)

                case .manualReadingView :
                    HStack{
                        Spacer()
                        ManualReadingView(viewModel: viewModel, index: viewModel.currentMeterIndex)
                            .transition(.opacity)
                        Spacer()
                    }
                    

                case .contactDetailsView :
                    ContactDetailsView(viewModel: viewModel)
                        .transition(.opacity)

                case .confirmationView :
                    ConfirmationView(viewModel: viewModel)
                        .transition(.opacity)

                case .successView :
                    SuccessVIew(viewModel: viewModel)
                        .transition(.opacity)
                    
                case .exampleView :
                    ExampleView(viewModel: viewModel)
                        .transition(.opacity)

                case .videoView :
                    VideoView(viewModel: viewModel)
                        .transition(.opacity)
                    
                default:
                    CodeReadingView(viewModel: viewModel)
                        .transition(.opacity)
            }

            if(viewModel.currentReadingView != .exampleView && viewModel.currentReadingView != .videoView && viewModel.currentReadingView != .meterReadingView && viewModel.currentReadingView != .successView){
                HStack{
                    Button(action : {
                        if(viewModel.currentReadingView == .codeReadingView){
                            viewModel.dismissReadingFlow.toggle()
                        }else{
                            withAnimation(.easeInOut){
                                viewModel.currentReadingView = viewModel.previousReadingView
                            }
                        }
                    }, label:{
                        RoundButtonStyle(imageName: "arrow.left", backgroundColor: Color.light, iconColor: Color.dark)
                    })
                    Spacer()
                }.background(Color.light.opacity(0.0))
                .padding(.top, 10)
                .padding(.leading, 19)
            }
                 
            

            if viewModel.isProgressBarActive{
                ZStack{
                Rectangle()
                    .foregroundColor(.dark)
                    .opacity(0.3)
                Loader()

                }
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationTitle("")
                .navigationBarHidden(true)
            }
        }.navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct MeterReadingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        MeterReadingFlowView(viewModel: MainViewModel())
    }
}
