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
                        FloatingTextField(placeHolder: "FirstNameTextField", text: $viewModel.userData.firstName, isRequired: true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "LastNameTextField", text: $viewModel.userData.lastName, isRequired: true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "EmailTextField", text: $viewModel.userData.email, isRequired: false)
                        
                        HStack{
                            Toggle("",isOn: $viewModel.postModelData.sendCopy)
                                    .labelsHidden()
                                    .toggleStyle(SwitchToggleStyle(tint: .primary_color))
                            Text(LocalizedStringKey("SendCopyText"))
                              .paragraph()
                              .foregroundColor(.dark)
                            Spacer()
                        }.frame(height:64)
                        FloatingTextField(placeHolder: "PhoneTextField", text: $viewModel.userData.phone, isRequired: false)
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
                        FloatingTextField(placeHolder: "StreetTextField", text: $viewModel.userData.street, isRequired: true)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "HouseNumberTextField", text: $viewModel.userData.houseNumber, isRequired: true)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "PostcodeTextField", text: $viewModel.userData.postcode, isRequired: true)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "CityTextField", text: $viewModel.userData.city, isRequired: true)
                            .disabled(true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "FloorTextField", text: $viewModel.userData.floor, isRequired: false)
                            .disabled(true)
                            .padding(.bottom, 7)
                     }
                    }.padding(.horizontal, 24)
                     .padding(.bottom, 58)
                        
                        PrimaryButton(handler: {
                            withAnimation(.easeInOut){
                                viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                            }
                        }, buttonLabel: "Next")
                        .padding(.bottom, 30)
                        .padding(.horizontal, 24)

                    Spacer()
                }
                .padding(.top, 62)
            }
                .navigationTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(viewModel: MainViewModel())
    }
}
