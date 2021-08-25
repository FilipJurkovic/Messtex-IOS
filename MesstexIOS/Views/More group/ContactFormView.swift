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

    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.dark)
                }
            }
        })
    }

    var body: some View {
        ScrollView(showsIndicators: false){ 
            VStack(alignment: .leading, spacing: 0){
                    ZStack{
                        HStack{
                            btnBack
                                .frame(width: 44, height: 44)
                                .offset(x:-10)
                            
                            Spacer()
                        }
                        HStack{
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
                FloatingTextField(placeHolder: "EmailTextField", text: $viewModel.contactFormData.email, isRequired: true)
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
                viewModel.takeContactForm()
                self.presentationMode.wrappedValue.dismiss()
            }, buttonLabel: "Send", isEnabled: viewModel.isContactFormValid())
            .padding(.bottom, 30)
            .padding(.horizontal, 24)
        }

    }

}

struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView(viewModel: MainViewModel())
    }
}
