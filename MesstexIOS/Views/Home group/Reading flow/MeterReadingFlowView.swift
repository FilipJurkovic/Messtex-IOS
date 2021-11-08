//
//  MeterReadingFlowView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 02.08.2021..
//

import SwiftUI
import AVFoundation
import MeterReading

struct MeterReadingFlowView: View {
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack(alignment: .topLeading) {

            switch viewModel.currentReadingView {
            case .codeReadingView :
                CodeReadingView(viewModel: viewModel)
                    .transition(.opacity)

            case .readingStepsView :
                ReadingStepsView(viewModel: viewModel)
                    .transition(.opacity)

            

            case .manualReadingView :
                HStack {
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
                    .disabled(viewModel.isConfrimationWidgetVsible)

            case .successView :
                SuccessVIew(viewModel: viewModel)
                    .transition(.opacity)

            case .exampleView :
                ExampleView(viewModel: viewModel)
                    .transition(.opacity)

            case .videoView :
                VideoView(viewModel: viewModel)
                    .transition(.opacity)
                
          

       
            case .testMeterPopup:
                TestingMeterPopupView(viewModel: viewModel)
                
            case .testFinalPopup:
                TestingFinalPopupView(viewModel: viewModel)
                
            default:
                CodeReadingView(viewModel: viewModel)
                    .transition(.opacity)
            }

            if viewModel.currentReadingView != .exampleView && viewModel.currentReadingView != .videoView && viewModel.currentReadingView != .meterReadingView {
                HStack {
                    Button(action: {

                        switch viewModel.currentReadingView {
                        case .codeReadingView:
                            viewModel.dismissReadingFlow.toggle()

                        case .readingStepsView:
                            viewModel.currentReadingView = .codeReadingView
                            
                        case .manualReadingView:
                            viewModel.currentReadingView = viewModel.previousReadingView

                        default:
                            viewModel.currentReadingView = viewModel.previousReadingView
                        }
                    }, label: {
                        RoundButtonStyle(imageName: "arrow.left", backgroundColor: Color.light, iconColor: Color.dark)
                    }).disabled(viewModel.isConfrimationWidgetVsible || viewModel.isMeterTypePopupVisible)
                    Spacer()
                }.background(Color.light.opacity(0.0))
                .padding(.top, 10)
                .padding(.leading, 19)
            }
       
            if viewModel.isProgressBarActive {
                ZStack {
                    Rectangle()
                        .foregroundColor(.dark)
                        .opacity(0.3)
                    Loader(takingMeterReadings: !viewModel.postModelData.meterReadings.isEmpty)

                }
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationTitle("")
                .navigationBarHidden(true)
            }

            if viewModel.isConfrimationWidgetVsible {
                ZStack {
                    Rectangle()
                        .foregroundColor(.dark)
                        .opacity(0.3)
                    DataConfirmationPopup(
                        confirmAction: {
                            withAnimation(.easeInOut) {
                                viewModel.isConfrimationWidgetVsible.toggle()
                                viewModel.takeMeterReadings()
                            }
                        },
                        cancelAction: {
                            withAnimation(.easeInOut) {
                                viewModel.isConfrimationWidgetVsible.toggle()
                            }
                        }
                    )

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

    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }

}

struct MeterReadingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        MeterReadingFlowView(viewModel: MainViewModel())
    }
}
