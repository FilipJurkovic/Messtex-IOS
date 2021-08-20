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
    
    @State var popBacktoReadingSteps: Bool = false
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
                
                TabView(selection: $viewModel.currentReadingView){
//                    CodeReadingView(viewModel: viewModel)
//                        .tag(ReadingFlowEnum.codeReadingView)
//                        .simultaneousGesture(DragGesture())
//
//                    ReadingStepsView(viewModel: viewModel)
//                        .tag(ReadingFlowEnum.readingStepsView)
//                        .simultaneousGesture(DragGesture())
                    
                    MeterReadingView(cameraView: CameraView(captureAction: { image, values in
                       
                        viewModel.postModelData.meterReadings[viewModel.currentMeterIndex].counterValue = viewModel.removePoint(value: values[0])
                        
                        viewModel.currentReadingView = ReadingFlowEnum.manualReadingView
                    }), index: viewModel.currentMeterIndex, popToReadingSteps: $popBacktoReadingSteps, viewModel: viewModel)
                        .tag(ReadingFlowEnum.meterReadingView)
                        .simultaneousGesture(DragGesture())
                    
                    ManualReadingView(viewModel: viewModel, popToReadingSteps: $popBacktoReadingSteps, index: viewModel.currentMeterIndex)
                        .tag(ReadingFlowEnum.manualReadingView)
                        .simultaneousGesture(DragGesture())
                    
//                    ContactDetailsView(viewModel: viewModel)
//                        .tag(ReadingFlowEnum.contactDetailsView)
//                        .simultaneousGesture(DragGesture())
//
//                    ConfirmationView(viewModel: viewModel)
//                        .tag(ReadingFlowEnum.confirmationView)
//                        .simultaneousGesture(DragGesture())
//
//                    SuccessVIew(viewModel: viewModel)
//                        .tag(ReadingFlowEnum.successView)
//                        .simultaneousGesture(DragGesture())
                }
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut)
                .transition(.slide)
                .navigationTitle("")
                .navigationBarHidden(true)
                .onAppear(){
                    UIPageControl.appearance().currentPageIndicatorTintColor = .clear
                    UIPageControl.appearance().pageIndicatorTintColor = .clear
                    UITabBar.appearance().isHidden = true
                }
            
            if viewModel.currentReadingView == ReadingFlowEnum.manualReadingView{
                HStack{
                    Button(action : { viewModel.currentReadingView = ReadingFlowEnum.meterReadingView }, label:{
                        RoundButtonStyle(imageName: "arrow.left", backgroundColor: Color.white, iconColor: Color.dark)
                    }).padding(.leading, 24)
                    .padding(.top, 10)
                    Spacer()
                }.background(Color.light.opacity(0.0))
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
