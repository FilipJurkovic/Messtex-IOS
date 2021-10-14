//
//  TestingFinalPopupView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 12.10.2021..
//

import SwiftUI

struct TestingFinalPopupView: View {
    
    var viewModel: MainViewModel
    
    var resultsHeat: [Double] = [6.090, 6.090, 6.090, 6.090, 6.090, 6.090]
    var resultsWater: [Double] = [131.802, 36.458, 3.0, 34.027, 22.9, 0.756, 153.219, 0.692]
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.dark)
                .opacity(0.0)
            TestingFinalPopUp(
                exitAction: {
                    withAnimation(.easeInOut) {
                        viewModel.isTestingIntroFinalPopupVisible.toggle()
                        viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
                        viewModel.previousReadingView = ReadingFlowEnum.codeReadingView
                    }
                },
                score: "\(getCorectResults()) / \(resultsWater.count)",
                pass: getCorectResults() == resultsWater.count ? "TRUE" : "FALSE"
            )
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func getCorectResults() -> Int{
        var correctResults: Int  = 0
        switch viewModel.testMeterConfiguration.meterAppearance {
        case "AUTO_DE_WATER_HOME":
            for result in viewModel.testingMeterResults {
                if(result == resultsWater[viewModel.testingMeterResults.firstIndex(of: result)!]){
                    correctResults += 1
                }
            }
            
            
        default:
            for result in viewModel.testingMeterResults {
                if(result == resultsHeat[viewModel.testingMeterResults.firstIndex(of: result)!]){
                    correctResults += 1
                }
            }
            
        }
        
            return correctResults
        
    }
}

