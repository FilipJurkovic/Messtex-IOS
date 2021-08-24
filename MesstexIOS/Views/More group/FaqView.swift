//
//  FaqView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct FaqView: View {
    
    @ObservedObject var viewModel : MainViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
        VStack{
            ZStack{
                HStack{
                    btnBack
                        .frame(width: 44, height: 44)
                        .offset(x:-10)
                    
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text(LocalizedStringKey("Faq"))
                        .heading2()
                        .foregroundColor(.primary_color)
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            FaqWidget(questionCount: viewModel.faq.faqs.count, flags: $viewModel.faqFlagIndex, faq: viewModel.faq)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
         
            Spacer()
            }
        }
    }
//struct FaqView_Previews: PreviewProvider {
//    static var previews: some View {
//        FaqView(viewModel: MainViewModel())
//    }
//}
