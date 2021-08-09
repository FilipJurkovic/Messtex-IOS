//
//  FaqView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct FaqView: View {

    @ObservedObject var viewModel: MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 9.23, height: 8.62)
                    .foregroundColor(.dark)
                    .padding()
            }
        })
    }

    var body: some View {
        VStack {
            FaqWidget(questionCount: viewModel.faq.faqs.count, flags: $viewModel.faqFlagIndex, faq: viewModel.faq)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(LocalizedStringKey("Faq"), displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        btnBack
                    }
                }
            Spacer()
        }
    }
}
// struct FaqView_Previews: PreviewProvider {
//    static var previews: some View {
//        FaqView(viewModel: MainViewModel())
//    }
// }
