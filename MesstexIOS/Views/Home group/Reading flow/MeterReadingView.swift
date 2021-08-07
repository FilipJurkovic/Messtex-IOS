//
//  MeterReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 23.07.2021..
//

import AVFoundation
import SwiftUI
import UIKit

struct CameraHeaderView: View {

    var safeAreaInset: CGFloat = 0

    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text("\(NSLocalizedString("ReadingDate", comment: "ReadingDate")) \(Date().formatDate())" as String)
                    .paragraph()
                    .foregroundColor(.light)
                Spacer()
            }
            HStack {
                Button(action: {
                    viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                }, label: {
                    RoundButtonStyle(imageName: "xmark", backgroundColor: .tetriary_tint, iconColor: .dark)
                })
                .accentColor(.white)
                .padding(.leading, 10)

                Spacer()
            }
        }        .padding(.top, safeAreaInset)
        .background(Color.clear)

    }

}

struct MeterReadingView: View {

    var cameraView: CameraView

    var index: Int = 0

    @ObservedObject var viewModel: MainViewModel
    var body: some View {
        GeometryReader { _ in
            ZStack {
                cameraView
                Image("overlay_image")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                VStack(spacing: 0) {
                    CameraHeaderView(safeAreaInset: 43, viewModel: viewModel)
                    Spacer()
                    Text("\(NSLocalizedString("ScanMessage", comment: "ScanMessage"))\nNr. \(viewModel.formatNumber(number: viewModel.userData.meters[index].counterNumber))" as String)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.light)
                        .padding(.bottom, 42)

                    Button(
                        action: { viewModel.currentReadingView = ReadingFlowEnum.manualReadingView },
                        label: {
                            ManualReadingButtonStyle()
                        })
                        .padding(.bottom, 46)
                        .onTapGesture {
                            let meterModel: MeterReceivingData = viewModel.userData.meters[index]
                            if !viewModel.postModelData.meterReadings.isEmpty && viewModel.postModelData.meterReadings.endIndex-1 < index {
                                viewModel.postModelData.meterReadings[index] = MeterReadingData(counterNumber: meterModel.counterNumber, counterType: meterModel.counterType, counterValue: "", userMessage: "")
                            } else {
                                viewModel.postModelData.meterReadings.append(MeterReadingData(counterNumber: meterModel.counterNumber, counterType: meterModel.counterType, counterValue: "", userMessage: ""))
                            }
                        }

                    HStack {
                        Button(action: {cameraView.toggleFlash(state: !viewModel.isTorchOn)
                            viewModel.isTorchOn = !viewModel.isTorchOn
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
                        }).padding(.trailing, 15)
                        Button(action: {
                            viewModel.isInfoSheetOpen = !viewModel.isInfoSheetOpen

                        }, label: {
                            LargeRoundButtonStyle(imageName: "info", backgroundColor: .primary_color, iconColor: .light)
                        })

                    }.padding(.bottom, 50)
                }
            }
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.isInfoSheetOpen) {
            InfoView(viewModel: viewModel, index: viewModel.getInfoViewIndex(meterType: viewModel.userData.meters[index].counterType))
        }
    }

}

// struct MeterReadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MeterReadingView(isManualCaptureAllowed: true, captureAction: {image, values in})
//            MeterReadingView(isManualCaptureAllowed: false, captureAction: {image, values in})
//            MeterReadingView(isManualCaptureAllowed: true, captureAction: {image, values in})
//            MeterReadingView(isManualCaptureAllowed: false, captureAction: {image, values in})
//        }
//    }
// }
