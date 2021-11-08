//
//  ContactDetailsView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24.07.2021..
//

import SwiftUI

struct ContactDetailsView: View {

    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ScrollView(showsIndicators: false) {
            Group {
                VStack(spacing: 0) {
                    HStack {
                        Text(LocalizedStringKey("ContactDetailsTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 15)
                        Spacer()
                    }
                    HStack {
                        Text(LocalizedStringKey("ContactDetailsSubtitle"))
                            .paragraph()
                            .foregroundColor(.dark)
                            .padding(.bottom, 19)
                        Spacer()
                    }

                    Group {
                        FloatingTextField(placeHolder: "FirstNameTextField", text: $viewModel.userData.firstName, isRequired: true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "LastNameTextField", text: $viewModel.userData.lastName, isRequired: true)
                            .padding(.bottom, 7)
                        FloatingTextField(placeHolder: "EmailTextField", text: $viewModel.userData.email, isRequired: false, error: viewModel.emailError)

                        HStack {
                            Toggle("", isOn: $viewModel.postModelData.sendCopy)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: .primary_color))
                            Text(LocalizedStringKey("SendCopyText"))
                                .paragraph()
                                .foregroundColor(.dark)
                            Spacer()
                        }.frame(height: 64)
                        
                        HStack {
                            Toggle("", isOn: $viewModel.postModelData.subscribeNewsletter)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: .primary_color))
                            Text(LocalizedStringKey("RecieveNewsletterText"))
                                .paragraph()
                                .foregroundColor(.dark)
                            Spacer()
                        }.frame(height: 64)
                        
                        HStack {
                            Toggle("", isOn: $viewModel.postModelData.getMeterReadingLetterByEmail)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: .primary_color))
                            Text(LocalizedStringKey("RecieveViaEmailText"))
                                .paragraph()
                                .foregroundColor(.dark)
                            Spacer()
                        }.frame(height: 64)
                        
                        FloatingTextField(placeHolder: "PhoneTextField", text: $viewModel.userData.phone, isRequired: false)
                            .padding(.bottom, 32)
                    }

                    Group {
                        HStack {
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
                    if textFieldValidatorEmail(viewModel.userData.email) {
                        viewModel.emailError = false
                        viewModel.readingStepsProgress[viewModel.readingStepsProgress.endIndex-1] = true
                        withAnimation(.easeInOut) {
                            viewModel.currentReadingView = ReadingFlowEnum.readingStepsView
                        }
                    } else {
                        viewModel.emailError = true
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

    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        // let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(viewModel: MainViewModel())
    }
}
