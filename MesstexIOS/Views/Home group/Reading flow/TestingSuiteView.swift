//
//  MeterReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 23.07.2021..
//

//import SwiftUI
//import UIKit
//import AVFoundation
//import MeterReading
//
//struct ExitButtonView: View {
//    @ObservedObject var viewModel: MainViewModel
//
//    var body: some View {
//
//            HStack(alignment: .center) {
//                Button(action: {
//                    withAnimation(.easeInOut) {
//                        viewModel.currentReadingView = viewModel.previousReadingView
//                    }
//                }) {
//                    ExitButtonStyle()
//                }
//                .accentColor(.white)
//                .padding(.leading, 24)
//
//                Spacer()
//            }
//             .padding(.top, 13)
//        .background(Color.clear)
//
//    }
//
//}
//
//struct FlashlightFooterView: View {
//    @Binding var isFlashOn: Bool
//
//    var body: some View {
//        HStack {
//            Button(
//            action: { self.isFlashOn.toggle() },
//            label: {
//                ZStack {
//                    Circle()
//                        .frame(width: 48, height: 48)
//                        .foregroundColor(.primary_color)
//                    Image("bulb")
//                        .font(.body)
//                        .foregroundColor(.light)
//                        .padding()
//                }
//            })
//        }.padding(.bottom, 50)
//
//    }
//
//}
//
//struct TestSuiteView: View {
//
//    var index: Int = 0
//
//    @ObservedObject var viewModel: MainViewModel
//
//    private var cameraView: CameraView
//
//
//    var results: [Double] = []
//
//
////    init(viewModel: MainViewModel, captureAction: @escaping (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void) {
//        init(viewModel: MainViewModel, captureAction: @escaping (UIImage, [String]) -> Void) {
//        self.viewModel = viewModel
////        self.cameraView = CameraView(captureAction: { image, values, rawString, resultCodes in captureAction(image, values, rawString, resultCodes)}, viewModel: viewModel)
//        self.cameraView = CameraView(captureAction: { image, values in captureAction(image, values) })
//    }
//
//    var body: some View {
//        GeometryReader { _ in
//            ZStack{
//                ZStack {
//                    cameraView
//                    if UIScreen.main.bounds.size.height < 812 {
//                        Image("overlay_image")
//                            .resizable()
//                            .scaledToFill()
//                            .offset(y: -(812-UIScreen.main.bounds.size.height)/2)
//                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//                            .clipped()
//
//                    } else {
//                        Image("overlay_image")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//                            .clipped()
//                    }
//                    VStack {
//                        ExitButtonView(viewModel: viewModel)
//                        Spacer()
//                        FlashlightFooterView(isFlashOn: cameraView.isFlashOn)
//
//                    }
//                }
//
//                if viewModel.isTestingIntroPopupVisible {
//                    ZStack(alignment: .center) {
//                        Rectangle()
//                            .foregroundColor(.dark)
//                            .opacity(0.0)
//                        TestingIntroPopUp(
//                            confirmAction: {
//                                withAnimation(.easeInOut) {
//                                    viewModel.isTestingIntroPopupVisible.toggle()
//                                }
//                            },
//                            cancelAction: {
//                                withAnimation(.easeInOut) {
//                                    viewModel.isTestingIntroPopupVisible.toggle()
//                                    viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
//                                    viewModel.previousReadingView = viewModel.currentReadingView
//                                }
//                            },
//                            configuration: viewModel.testMeterConfiguration
//                        )
//                    }
//                    .ignoresSafeArea()
//                    .navigationBarBackButtonHidden(true)
//                    .navigationTitle("")
//                    .navigationBarHidden(true)
//                }
//
//            }
//        }
//        .navigationTitle("")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
//
//    }
//
//}



import SwiftUI
import MeterReading
/**
 the top bar should somewhat imitate what's there in the camera view of the Messages.app
 and other similar apps that have a "Return" button on the right upper hand
*/
struct CameraHeaderViewTest: View {

    @Binding var isFlashOn: Bool
    var safeAreaInset: CGFloat = 0

    var body: some View {
        HStack {
            Spacer()
            Button(
                action: { self.isFlashOn.toggle() },
                label: {
                    Image(systemName: self.isFlashOn ? "bolt.fill" : "bolt.slash.fill")
                        .font(.system(size: 20, weight: .medium, design: .default))
                })
            .accentColor(self.isFlashOn ? Color("AccentColor") : .white)
            .padding(.trailing, 10)

        }
        .padding(.top, safeAreaInset)
        .background(Color.secondary)
    }
}

struct TestSuiteView: View {
    
    private var cameraView: CameraView
    
    private var viewModel: MainViewModel

    init(viewModel: MainViewModel, captureAction: @escaping (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void) {
        self.viewModel = viewModel
        self.cameraView = CameraView(
            fractionConfig: viewModel.testMeterConfiguration.fractionDigitsAuto ? PIXAutomatic : viewModel.testMeterConfiguration.fractionDigits!,
            integerConfig: viewModel.testMeterConfiguration.integerDigitsAuto ? PIXAutomatic : viewModel.testMeterConfiguration.integerDigits!,
            numberOfCountersConfig: viewModel.testMeterConfiguration.numberOfCountersAuto ? PIXAutomatic : viewModel.testMeterConfiguration.numberOfCounters!,
            meterAppearanceConfig: viewModel.getCounterType(type: viewModel.testMeterConfiguration.meterAppearance),
            captureAction: { image, values, rawStrings, resultCodes in captureAction(image, values, rawStrings, resultCodes) })
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
                                FlashlightFooterView(isFlashOn: cameraView.isFlashOn)
        
                            }
                        }
        
//                        if viewModel.isTestingIntroPopupVisible {
//                            ZStack(alignment: .center) {
//                                Rectangle()
//                                    .foregroundColor(.dark)
//                                    .opacity(0.0)
//                                TestingIntroPopUp(
//                                    confirmAction: {
//                                        withAnimation(.easeInOut) {
//                                            viewModel.isTestingIntroPopupVisible.toggle()
//                                        }
//                                    },
//                                    cancelAction: {
//                                        withAnimation(.easeInOut) {
//                                            viewModel.isTestingIntroPopupVisible.toggle()
//                                            viewModel.currentReadingView = ReadingFlowEnum.codeReadingView
//                                            viewModel.previousReadingView = viewModel.currentReadingView
//                                        }
//                                    },
//                                    configuration: viewModel.testMeterConfiguration
//                                )
//                            }
//                            .ignoresSafeArea()
//                            .navigationBarBackButtonHidden(true)
//                            .navigationTitle("")
//                            .navigationBarHidden(true)
//                        }
        
                    }
                }
                .navigationTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)

    }
}

struct FlashlightFooterView: View {
    @Binding var isFlashOn: Bool

    var body: some View {
        HStack {
            Button(
            action: { self.isFlashOn.toggle() },
            label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.primary_color)
                    Image("bulb")
                        .font(.body)
                        .foregroundColor(.light)
                        .padding()
                }
            })
        }.padding(.bottom, UIScreen.main.bounds.size.height < 812 ? 50 : 100)

    }

}

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

//struct CameraCaptureView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            TestSuiteView(isManualCaptureAllowed: true, captureAction: {image, values in})
//            TestSuiteView(isManualCaptureAllowed: false, captureAction: {image, values in})
//            TestSuiteView(isManualCaptureAllowed: true, captureAction: {image, values in})
//            TestSuiteView(isManualCaptureAllowed: false, captureAction: {image, values in})
//        }
//    }
//}
