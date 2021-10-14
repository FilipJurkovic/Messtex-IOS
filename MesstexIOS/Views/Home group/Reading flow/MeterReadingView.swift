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

struct CameraHeaderView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Spacer()
                HStack(alignment: .center/*@END_MENU_TOKEN@*/, spacing: 4) {
                    Text(LocalizedStringKey("ReadingDate"))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.light)

                    Text(Date().formatDate() as String)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.light)

                }
                Spacer()
            }
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
        }        .padding(.top, 13)
        .background(Color.clear)

    }

}

struct CameraFooterView: View {
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
            .padding(.trailing, 15)

            Button(action: {
                viewModel.isInfoSheetOpen = !viewModel.isInfoSheetOpen

            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.primary_color)
                    Image(systemName: "info")
                        .font(.body)
                        .foregroundColor(.light)
                        .padding()
                }
            })

        }.padding(.bottom, 50)

    }

}

struct MeterReadingView: View {

    var index: Int = 0

    @ObservedObject var viewModel: MainViewModel

    private var cameraView: CameraView

    init(index: Int, viewModel: MainViewModel, captureAction: @escaping (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void) {
        self.index = index
        self.viewModel = viewModel
        self.cameraView = CameraView(captureAction: { image, values, rawStrings, resultCodes in captureAction(image, values, rawStrings, resultCodes)}, viewModel: viewModel)

    }

    var body: some View {
        GeometryReader { _ in
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
                    CameraHeaderView(viewModel: viewModel)

                    Spacer()
                    VStack(spacing: 0) {
                        Text(LocalizedStringKey("ScanMessage"))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.light)

                        Text("\(viewModel.userData.meters[index].counterRoom), \(viewModel.userData.meters[index].counterTypeName) Nr. \(viewModel.userData.meters[index].counterNumber)")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                            .foregroundColor(.light)

                    }.padding(.bottom, 30)

                    Button(
                        action: {
                            let meterModel: MeterReceivingData = viewModel.userData.meters[index]
                            if !viewModel.postModelData.meterReadings.isEmpty && viewModel.postModelData.meterReadings.endIndex-1 >= index {
                                viewModel.postModelData.meterReadings[index] = MeterReadingData(counterNumber: meterModel.counterNumber, counterType: meterModel.counterType, counterValue: "", rawReadingString: "", cleanReadingString: "", readingResultStatus: "",  userMessage: "")
                            } else {
                                viewModel.postModelData.meterReadings.append(MeterReadingData(counterNumber: meterModel.counterNumber, counterType: meterModel.counterType, counterValue: "", rawReadingString: "", cleanReadingString: "", readingResultStatus: "", userMessage: ""))
                            }
                            viewModel.currentReadingView = ReadingFlowEnum.manualReadingView
                        },
                        label: {
                            ManualReadingButtonStyle()
                        })
                        .padding(.bottom, 30)

                    CameraFooterView(viewModel: viewModel, isFlashOn: cameraView.isFlashOn)

                }
            }
        }
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
