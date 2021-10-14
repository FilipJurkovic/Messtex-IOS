//
//  TestingMeterPopupView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 12.10.2021..
//

import SwiftUI

struct TestingMeterPopupView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.dark)
                .opacity(0.0)
            TestingMeterPopUp(
                confirmAction: {
                    withAnimation(.easeInOut) {
                        viewModel.testingMeterResults.append(viewModel.testMeterResult.counterValue)
                        viewModel.testingMeterIndex = viewModel.testingMeterIndex + 1
                        
                        print(viewModel.testingMeterIndex)
                        
                        if(viewModel.testingMeterIndex == 8){
                            viewModel.previousReadingView = ReadingFlowEnum.codeReadingView
                            viewModel.currentReadingView = ReadingFlowEnum.testFinalPopup
                        } else{
                            viewModel.previousReadingView = ReadingFlowEnum.codeReadingView
                            viewModel.currentReadingView = ReadingFlowEnum.testingView
                        }
                        
                    }
                },
                cancelAction: {
                    withAnimation(.easeInOut) {
                        viewModel.previousReadingView = ReadingFlowEnum.codeReadingView
                        viewModel.currentReadingView = ReadingFlowEnum.testingView
                    }
                },
                meterRawValue: viewModel.testMeterResult.meterRawValue,
                meterResultCode: viewModel.testMeterResult.meterResultCode,
                counterValue: viewModel.testMeterResult.counterValue
            )
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

