//
//  ContactFormView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct ContactFormView: View {

    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var isTapped = false

    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "arrow.backward")
                    .font(.body)
                    .foregroundColor(.dark)
                    .padding()
            }
        })
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                Text(LocalizedStringKey("ContactFormTitle"))
                    .heading2()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 16)

                Text(LocalizedStringKey("ContactFormParagraph"))
                    .paragraph()
                    .padding(.bottom, 19)

                FloatingTextField(placeHolder: "FirstNameTextField", text: $viewModel.contactFormData.name)
                    .padding(.bottom, 7)
                FloatingTextField(placeHolder: "EmailTextField", text: $viewModel.contactFormData.email)
                    .padding(.bottom, 7)
                FloatingTextField(placeHolder: "Subject", text: $viewModel.contactFormData.subject)
                    .padding(.bottom, 7)

                FloatingTextEditor(placeHolder: "Message", text: $viewModel.contactFormData.message)

                Text(LocalizedStringKey("RequiredFields"))
                    .small()
                    .foregroundColor(.medium)
                    .padding(EdgeInsets(top: 9, leading: 0, bottom: 0, trailing: 0))

            }
            .padding(.init(top: 25, leading: 24, bottom: 54, trailing: 24))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(LocalizedStringKey("ContactForm"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                        .foregroundColor(.dark)
                }
            }

            PrimaryButton(handler: {
                viewModel.takeContactForm()
                self.presentationMode.wrappedValue.dismiss()
            }, buttonLabel: "Send", isEnabled: viewModel.isContactFormValid())
        }

    }

}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(viewModel: MainViewModel())
    }
}
