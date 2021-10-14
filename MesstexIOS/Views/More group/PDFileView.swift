//
//  PDFileView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 21.09.2021..
//

import SwiftUI

struct PDFileView: View {
    var url: URL
    var title: String

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        RoundButtonStyle(imageName: "arrow.left", backgroundColor: Color.light, iconColor: Color.dark)
    }
    }

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.light)
                HStack {
                    btnBack
                        .padding(.leading, 7)

                    Spacer()
                }

                HStack {
                    Spacer()
                    Text(LocalizedStringKey(title))
                        .heading2()
                        .foregroundColor(.primary_color)
                    Spacer()
                }

            }.frame(width: UIScreen.main.bounds.size.width, height: 50)

            PDFKitRepresentedView(url)

        }.navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

// struct PDFileView_Previews: PreviewProvider {
//    static var previews: some View {
//        PDFileView(url: Bundle.main.url(forResource: viewModel.language == "English" ? "Privacy_EN": "Privacy_DE", withExtension: "pdf")!, title: "Title")
//    }
// }
