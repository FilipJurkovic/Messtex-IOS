//
//  ReadingStepsView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 22.07.2021..
//

import SwiftUI

struct ReadingStepsView: View {
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {

        ScrollView(showsIndicators: false) {
            VStack {

                ReadingFlowHeaderWidget(title: "ReadingStepsTitle", description: "ReadingStepsSubTitle")
                    .padding(.bottom, 41)

                VStack(spacing: 0) {
                    ForEach(0...viewModel.userData.meters.count, id: \.self) { index in

                        let lastIndexCheck: Bool = index != (viewModel.readingStepsProgress.endIndex - 1)

                        VStack(alignment: HorizontalAlignment.leading, spacing: 0) { HStack {

                            if index < (viewModel.readingStepsProgress.endIndex - 1) {

                                if viewModel.readingStepsProgress[index] {
                                    Image("bullet_point")
                                        .frame(width: 36, height: 36)
                                        .padding(.trailing, 17)
                                } else {
                                    StepIndicator(stepIndex: index+1)
                                }
                                Image(viewModel.getMeterTypeIcon(meterType: viewModel.userData.meters[index].counterType))
                                    .resizable()
                                    .frame(width: 18, height: 18)

                                Text(viewModel.userData.meters[index].counterTypeName)
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.leading, 9)
                                Spacer()
                                Button(
                                    action: {
                                        viewModel.currentMeterIndex = index
                                        viewModel.currentReadingView = ReadingFlowEnum.meterReadingView
                                    },
                                    label: {
                                        if viewModel.readingStepsProgress[index] {
                                            ChangeButtonStyle()
                                        } else {
                                            SubmitButtonStyle()
                                        }
                                    })

                            } else {
                                if viewModel.readingStepsProgress.last! {
                                    Image("bullet_point")
                                        .frame(width: 36, height: 36)
                                        .padding(.trailing, 17)
                                } else {
                                    StepIndicator(stepIndex: index+1)
                                }

                                Text(LocalizedStringKey("ContactData"))
                                    .paragraphBold()
                                    .foregroundColor(.primary_color)
                                    .padding(.leading, 9)
                                Spacer()
                                Button(
                                    action: { viewModel.currentReadingView = ReadingFlowEnum.contactDetailsView },
                                    label: {
                                        if viewModel.readingStepsProgress.last! {
                                            ChangeButtonStyle()
                                        } else {
                                            SubmitButtonStyle()
                                        }
                                    })
                            }
                        }

                        if lastIndexCheck {
                            Rectangle().fill(Color.primary_shade).frame(width: 2, height: 32, alignment: .center).padding(.leading, 17)
                        }
                        }.padding(.horizontal, 24)
                        .frame(width: UIScreen.main.bounds.size.width)
                    }}
                    .padding(.bottom, 43)

                Button(
                    action: { viewModel.currentReadingView = ReadingFlowEnum.confirmationView },
                    label: {
                        PrimaryButtonStyle(buttonLabel: "SubmitReadings", isEnabled: viewModel.checkReadingStepStatus())
                    })
                Spacer()
            }
            .padding(.top, 12)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ReadingStepsView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingStepsView(viewModel: MainViewModel())
    }
}
