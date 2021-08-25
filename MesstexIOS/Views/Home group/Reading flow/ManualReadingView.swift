//
//  ManualReadingView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24.07.2021..
//

import SwiftUI

struct ManualReadingView: View {

    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var index: Int

    var body: some View {
        ScrollView(showsIndicators: false){
        VStack{
            Image("reading_graphics")
                .resizable()
                .frame(width: 114, height: 95)
                .padding(.top, 50)
            
            Text(LocalizedStringKey("ManualInputTitle"))
              .heading1()
              .foregroundColor(.primary_color)
              .padding(.bottom, 25)
          
          Text(LocalizedStringKey("ManualInputSubtitle"))
            .paragraph()
            .foregroundColor(.dark)
            .multilineTextAlignment(.center)
            .padding(.bottom, 28)
            VStack(spacing:0){
                FloatingTextField(placeHolder: "CounterTypeTextField", text: $viewModel.userData.meters[index].counterNumber, isRequired: false)
                    .padding(.bottom, 7)
                    .disabled(true)
                FloatingTextField(placeHolder: "CounterTypeTextField", text: $viewModel.userData.meters[index].counterType, isRequired: false)
                    .padding(.bottom, 7)
                    .disabled(true)
                FloatingTextField(placeHolder: "ReadingDateTextField", text: .constant(Date().formatDate()), isRequired: false)
                    .padding(.bottom, 35)
                    .disabled(true)
                
                HStack{
                    Text(viewModel.userData.meters[index].counterTypeName)
                      .paragraphBold()
                      .foregroundColor(.primary_color)
                      .padding(.bottom, 15)
                    Spacer()
                }
                
                HStack{
                    ZStack{
                        Image("manual_reading_shape")
                            .resizable()
                            .frame(height:57)
                        
                        pinDots
                        backgroundField
                }.frame(height:57)
                }.padding(.bottom, 24)
                
                HStack{
                    Text(LocalizedStringKey("MessageTitle"))
                      .paragraphBold()
                      .foregroundColor(.primary_color)
                      .padding(.bottom, 25)
                    Spacer()
                }
                
                FloatingTextEditor(placeHolder: "Message", text: $viewModel.postModelData.meterReadings[index].userMessage, isRequired: false)
                
            }
            .padding(.bottom, 80)
            
            PrimaryButton(handler: {
                withAnimation(.easeInOut){
                    viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                }
                viewModel.postModelData.meterReadings[index].counterValue = viewModel.addComma(value: viewModel.postModelData.meterReadings[index].counterValue)
                viewModel.readingStepsProgress[index] = true
                
            }, buttonLabel: "Next", isEnabled: viewModel.postModelData.meterReadings[index].counterValue != "")
            .padding(.bottom, 30)
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear(){
            
        }
    }
    }

    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0...8, id: \.self) { loopIndex in
                if loopIndex >= self.viewModel.postModelData.meterReadings[index].counterValue.count {
                } else {

                    Text(self.viewModel.postModelData.meterReadings[index].counterValue[String.Index(encodedOffset: loopIndex)...String.Index(encodedOffset: loopIndex)])
                        .font(Font.custom("Roboto", size: 40))
                        .foregroundColor(.primary_shade)
                }
            }
        }.offset(x: -18)
    }

    private var backgroundField: some View {
        TextField("", text: $viewModel.postModelData.meterReadings[index].counterValue, onCommit: { print(viewModel.postModelData.meterReadings[index].counterValue) })
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
