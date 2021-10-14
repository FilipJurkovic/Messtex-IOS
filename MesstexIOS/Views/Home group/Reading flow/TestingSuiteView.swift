//
//  MeterReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 23.07.2021..
//

import SwiftUI
import UIKit
import AVFoundation
import MeterReading

struct ExitButtonView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
       
            HStack(alignment: .center) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        viewModel.currentReadingView = viewModel.previousReadingView
                    }
                }) {
                    ExitButtonStyle()
                }
                .accentColor(.white)
                .padding(.leading, 24)

                Spacer()
            }
             .padding(.top, 13)
        .background(Color.clear)

    }

}

struct FlashlightFooterView: View {
    @ObservedObject var viewModel: MainViewModel

    @Binding var isFlashOn: Bool

    var body: some View {
        HStack {
            Button(action: {
                self.isFlashOn.toggle()
                print("Torch: \(self.isFlashOn)")

            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.primary_color)
                    Image("bulb")
                        .font(.body)
                        .foregroundColor(.light)
                        .padding()
                }
            }).disabled(false)
        }.padding(.bottom, 50)

    }

}

struct TestSuiteView: View {

    var index: Int = 0

    @ObservedObject var viewModel: MainViewModel

    private var cameraView: CameraView
    
    
    var results: [Double] = []
    

    init(viewModel: MainViewModel, captureAction: @escaping (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void) {
        self.viewModel = viewModel
        self.cameraView = CameraView(captureAction: { image, values, rawString, resultCodes in captureAction(image, values, rawString, resultCodes)}, viewModel: viewModel)
    }

    var body: some View {
        GeometryReader { _ in
            ZStack{
                ZStack {
                    cameraView
                    if UIScreen.main.bounds.size.height < 812 {
                        Image("overlay_image")
                            .resizable()
                            .scaledToFill()
                            .offset(y: -(812-UIScreen.main.bounds.size.height)/2)
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                            .clipped()

                    } else {
                        Image("overlay_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                            .clipped()
                    }
                    VStack {
                        ExitButtonView(viewModel: viewModel)
                        Spacer()
                        FlashlightFooterView(viewModel: viewModel, isFlashOn: cameraView.isFlashOn)

                    }
                }
                
                if viewModel.isTestingIntroPopupVisible {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.dark)
                            .opacity(0.0)
                        TestingIntroPopUp(
                            confirmAction: {
                                withAnimation(.easeInOut) {
                                    viewModel.isTestingIntroPopupVisible.toggle()
                                }
                            },
                            cancelAction: {
                                withAnimation(.easeInOut) {
                                    viewModel.isTestingIntroPopupVisible.toggle()
                                    viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
                                    viewModel.previousReadingView = viewModel.currentReadingView
                                }
                            },
                            configuration: viewModel.testMeterConfiguration
                        )
                    }
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle("")
                    .navigationBarHidden(true)
                }
                
//                if viewModel.isTestingMeterPopupVisible {
//                    ZStack(alignment: .center) {
//                        Rectangle()
//                            .foregroundColor(.dark)
//                            .opacity(0.0)
//                        TestingMeterPopUp(
//                            confirmAction: {
//                                withAnimation(.easeInOut) {
//                                    viewModel.isTestingMeterPopupVisible.toggle()
//                                    viewModel.testingMeterResults.append(viewModel.testMeterResult.counterValue)
//                                    viewModel.testingMeterIndex = viewModel.testingMeterIndex + 1
//                                    cameraView.startProcessing()
//                                }
//                            },
//                            cancelAction: {
//                                withAnimation(.easeInOut) {
//                                    viewModel.isTestingMeterPopupVisible.toggle()
//                                }
//                            },
//                            meterRawValue: viewModel.testMeterResult.meterRawValue,
//                            meterResultCode: viewModel.testMeterResult.meterResultCode,
//                            counterValue: viewModel.testMeterResult.counterValue
//                        )
//                    }
//                    .ignoresSafeArea()
//                    .navigationBarBackButtonHidden(true)
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                }
//
                
//                if viewModel.isTestingIntroFinalPopupVisible {
//                    
//                    ZStack(alignment: .center) {
//                        Rectangle()
//                            .foregroundColor(.dark)
//                            .opacity(0.0)
//                        TestingFinalPopUp(
//                            exitAction: {
//                                withAnimation(.easeInOut) {
//                                    viewModel.isTestingIntroFinalPopupVisible.toggle()
//                                    viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
//                                    viewModel.previousReadingView = viewModel.currentReadingView
//                                }
//                            },
//                            score: "\(getCorectResults()) / \(resultsWater.count)",
//                            pass: getCorectResults() == resultsWater.count ? "TRUE" : "FALSE"
//                        )
//                    }
//                    .ignoresSafeArea()
//                    .navigationBarBackButtonHidden(true)
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                }

            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.isInfoSheetOpen) {
            InfoView(viewModel: viewModel, index: viewModel.getInfoViewIndex(meterType: viewModel.userData.meters[index].counterType))
        }
    }
    
//    func getCorectResults() -> Int{
//        var correctResults: Int  = 0
//        switch viewModel.testMeterConfiguration.meterAppearance {
//        case "AUTO_DE_WATER_HOME":
//            for result in viewModel.testingMeterResults {
//                if(result == resultsWater[results.firstIndex(of: result)!]){
//                    correctResults += 1
//                }
//            }
//            
//            
//        default:
//            for result in viewModel.testingMeterResults {
//                if(result == resultsHeat[results.firstIndex(of: result)!]){
//                    correctResults += 1
//                }
//            }
//            
//        }
//        
//            return correctResults
//        
//    }

}

// struct TestSuiteView_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
// }
