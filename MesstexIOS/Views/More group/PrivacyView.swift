//
//  PrivacyView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct PrivacyView: View {
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
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {

                ZStack {
                    HStack {
                        btnBack
                            .frame(width: 44, height: 44)
                            .offset(x: -10)

                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text(LocalizedStringKey("Privacy"))
                            .heading2()
                            .foregroundColor(.primary_color)
                        Spacer()
                    }
                }.padding(.bottom, 26)

                Spacer()
            }
            .padding(.init(top: 25, leading: 24, bottom: 50, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
