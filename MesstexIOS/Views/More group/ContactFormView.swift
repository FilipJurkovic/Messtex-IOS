//
//  ContactFormView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct ContactFormView: View {

    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var isTapped = false

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.backward")
                .foregroundColor(.dark)
        }
    }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    HStack {
                        btnBack
                            .frame(width: 44, height: 44)
                            .offset(x: -10)

                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(LocalizedStringKey("ContactForm"))
                            .heading2()
                            .foregroundColor(.primary_color)
                        Spacer()
                    }
                }.padding(.bottom, 26)

                Text(LocalizedStringKey("ContactFormTitle"))
                    .heading2()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 16)

                Text(LocalizedStringKey("ContactFormParagraph"))
                    .paragraph()
                    .padding(.bottom, 19)

                FloatingTextField(placeHolder: "Name", text: $viewModel.contactFormData.name, isRequired: true)
                    .padding(.bottom, 7)
                FloatingTextField(placeHolder: "EmailTextField", text: $viewModel.contactFormData.email, isRequired: true, error: viewModel.emailError)
                    .padding(.bottom, 7)
                FloatingTextField(placeHolder: "Subject", text: $viewModel.contactFormData.subject, isRequired: false)
                    .padding(.bottom, 7)

                FloatingTextEditor(placeHolder: "Message", text: $viewModel.contactFormData.message, isRequired: true)

                Text(LocalizedStringKey("RequiredFields"))
                    .small()
                    .foregroundColor(.medium)
                    .padding(EdgeInsets(top: 9, leading: 0, bottom: 0, trailing: 0))

            }
            .padding(.init(top: 25, leading: 24, bottom: 54, trailing: 24))
            .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)

            PrimaryButton(handler: {
                if textFieldValidatorEmail(viewModel.contactFormData.email) {
                    viewModel.takeContactForm()
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    viewModel.emailError = true
                }

            }, buttonLabel: "Send", isEnabled: viewModel.isContactFormValid())
            .padding(.bottom, 30)
            .padding(.horizontal, 24)
        }

    }

    func textFieldValidatorEmail(_ string: String) -> Bool {
        print(string)
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        // let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(viewModel: MainViewModel())
    }
}
