//
//  ManualReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24.07.2021..
//

import SwiftUI

struct ManualReadingView: View {

    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var index : Int

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Image("reading_graphics")
                    .resizable()
                    .frame(width: 114, height: 95)

                Text(LocalizedStringKey("ManualInputTitle"))
                    .heading1()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 25)

                Text(LocalizedStringKey("ManualInputSubtitle"))
                    .paragraphBold()
                    .foregroundColor(.dark)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 28)
                VStack(spacing:0){
                    FloatingNumericTextField(placeHolder: "CounterNumberTextField", text: $viewModel.userData.meters[index].counterNumber)
                        .frame(width: 325)
                        .padding(.bottom, 7)
                        .disabled(true)
                    FloatingTextField(placeHolder: "CounterTypeTextField", text: $viewModel.userData.meters[index].counterType)
                        .frame(width: 325)
                        .padding(.bottom, 7)
                        .disabled(true)
                    FloatingTextField(placeHolder: "ReadingDateTextField", text: .constant(Date().formatDate()))
                        .frame(width: 325)
                        .padding(.bottom, 32)
                        .disabled(true)

                    HStack{
                        Text(viewModel.userData.meters[index].counterTypeName)
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 25)
                        Spacer()
                    }

                    ZStack{
                        Image("manual_reading_shape")
                            .resizable()
                            .frame(width:327, height:57)

                        pinDots
                        backgroundField
                    }

                    HStack{
                        Text(LocalizedStringKey("MessageTitle"))
                            .paragraphBold()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 25)
                        Spacer()
                    }

                    FloatingTextEditor(placeHolder: "Message", text: $viewModel.postModelData.meterReadings[index].userMessage)
                        .frame(width: 325)

                }
                .padding(.bottom, 80)

                Button(
                    action: {
                        viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                        viewModel.postModelData.meterReadings[index].counterValue = viewModel.addComma(value: viewModel.postModelData.meterReadings[index].counterValue)
                        viewModel.readingStepsProgress[index] = true
                    },
                    label: {
                        PrimaryButtonStyle(buttonLabel: "Next", isEnabled: true)
                    }).disabled(false)
                Spacer()
            }
            .frame(width: 327)
            .padding(.top, 12)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }

    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0...8, id: \.self) { loopIndex in
                if loopIndex >= self.viewModel.postModelData.meterReadings[index].counterValue.count {
                }

                else {

                    Text(self.viewModel.postModelData.meterReadings[index].counterValue[String.Index(encodedOffset: loopIndex)...String.Index(encodedOffset: loopIndex)])
                        .font(Font.custom("Roboto", size: 40))
                        .foregroundColor(.primary_shade)
                }
            }
        }.offset(x:-18)
    }

    private var backgroundField: some View {
        return TextField("", text: $viewModel.postModelData.meterReadings[index].counterValue, onCommit: {print(viewModel.postModelData.meterReadings[index].counterValue)})
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
            .frame(height: 48)
            .onChange(of: viewModel.postModelData.meterReadings[index].counterValue, perform: { value in
                if value.count > 8 {
                    viewModel.postModelData.meterReadings[index].counterValue.popLast()
                }
            })

    }
}

struct ManualReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ManualReadingView(viewModel: MainViewModel(), index: 0)
    }
}
