//
//  ContactDetailsView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24.07.2021..
//

import SwiftUI

struct ContactDetailsView: View {

    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ScrollView(showsIndicators: false){
            Group{
                VStack(spacing:0){
                    HStack{
                        Text(LocalizedStringKey("ContactDetailsTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 15)
                        Spacer()
                    }
                    HStack{
                        Text(LocalizedStringKey("ContactDetailsSubtitle"))
                            .paragraph()
                            .foregroundColor(.dark)
                            .padding(.bottom, 19)
                        Spacer()
                    }


                    Group{
                        FloatingTextField(placeHolder: "FirstNameTextField", text: $viewModel.userData.firstName)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "LastNameTextField", text: $viewModel.userData.lastName)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "EmailTextField", text: .constant(Date().formatDate()))

                        HStack{
                            Toggle("",isOn: $viewModel.postModelData.sendCopy)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: .primary_color))
                            Text(LocalizedStringKey("SendCopyText"))
                                .paragraph()
                                .foregroundColor(.dark)
                            Spacer()
                        }.frame(height:64)
                        FloatingTextField(placeHolder: "PhoneTextField", text: $viewModel.userData.phone)
                            .padding(.bottom, 32)
                    }

                    Group{
                        HStack{
                            Text(LocalizedStringKey("Address"))
                                .heading2()
                                .foregroundColor(.primary_color)
                                .padding(.bottom, 25)
                            Spacer()
                        }
                        FloatingTextField(placeHolder: "StreetTextField", text: $viewModel.userData.street)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "HouseNumberTextField", text: $viewModel.userData.houseNumber)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "PostcodeTextField", text: $viewModel.userData.postcode)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "CityTextField", text: $viewModel.userData.city)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "FloorTextField", text: $viewModel.userData.floor)
                            .disabled(true)
                            .padding(.bottom, 7)
                    }


                    HStack{
                        Text(LocalizedStringKey("ReasonOfReading"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 17)
                        Spacer()
                    }

                    RadioButtonGroup(items: ["Annual billing", "Change of supplier", "Control reading"], selectedId: viewModel.userData.readingReason) { selected in
                        print("Selected is: \(selected)")
                    }.disabled(true)


                }.frame(width:327)
                .padding(.bottom, 58)

                Button(
                    action: {
                        viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                    },
                    label: {
                        PrimaryButtonStyle(buttonLabel: "Next", isEnabled: viewModel.areContactDetailsValid())
                    }).disabled(!viewModel.areContactDetailsValid())
                //                .onTapGesture {
                //                    viewModel.readingStepsProgress[viewModel.readingStepsProgress.endIndex-1] = viewModel.areContactDetailsValid()
                //                }
                Spacer()
            }
            .padding(.top, 12)
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(viewModel: MainViewModel())
    }
}
