//
//  MeterReadingFlowView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 02.08.2021..
//

import SwiftUI

struct MeterReadingFlowView: View {
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if viewModel.currentReadingView != ReadingFlowEnum.meterReadingView && viewModel.currentReadingView != ReadingFlowEnum.successView {
                    HStack {
                        Button(action: {
                            if viewModel.currentReadingView == ReadingFlowEnum.codeReadingView {
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                viewModel.getPreviousTabView()
                            }

                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.dark)
                        }).padding(.leading, 24)
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 71.56, height: 46)
                            .padding(EdgeInsets(top: 18.2, leading: 0, bottom: 0, trailing: 30.1))
                    }.background(Color.clear)
                }
                TabView(selection: $viewModel.currentReadingView) {
                    CodeReadingView(viewModel: viewModel)
                        .tag(ReadingFlowEnum.codeReadingView)

                    ReadingStepsView(viewModel: viewModel)
                        .tag(ReadingFlowEnum.readingStepsView)

                    MeterReadingView(cameraView: CameraView(captureAction: { image, values in

                        viewModel.postModelData.meterReadings[viewModel.currentMeterIndex].counterValue = viewModel.removePoint(value: values[0])

                        viewModel.currentReadingView = ReadingFlowEnum.manualReadingView
                    }), index: viewModel.currentMeterIndex, viewModel: viewModel)
                    .tag(ReadingFlowEnum.meterReadingView)

                    ManualReadingView(viewModel: viewModel, index: viewModel.currentMeterIndex)
                        .tag(ReadingFlowEnum.manualReadingView)

                    ContactDetailsView(viewModel: viewModel)
                        .tag(ReadingFlowEnum.contactDetailsView)

                    ConfirmationView(viewModel: viewModel)
                        .tag(ReadingFlowEnum.confirmationView)

                    SuccessVIew(viewModel: viewModel)
                        .tag(ReadingFlowEnum.successView)
                }
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut)
                .transition(.slide)
                .navigationTitle("")
                .navigationBarHidden(true)
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .clear
                    UIPageControl.appearance().pageIndicatorTintColor = .clear
                }
            }

            if viewModel.isProgressBarActive {
                ZStack {
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
        }
    }
}

struct MeterReadingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        MeterReadingFlowView(viewModel: MainViewModel())
    }
}
