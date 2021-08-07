//
//  ContactView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct ContactView: View {
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
        VStack(alignment:.leading){
            Text(LocalizedStringKey("ContactTitle"))
                .heading1()
                .foregroundColor(.primary_color)
                .padding(.bottom, 24)
            Text("Email")
                .paragraphBold()
                .foregroundColor(.primary_color)
                .padding(.bottom, 5)
            Button(action: {
                EmailHelper.shared.send(subject: "Support question", body: "", to: ["support@messtex.de"])

            }, label: {
                Text("support@messtex.de")
                    .underline()
                    .paragraph()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 26)

            })

            Text("Anschrift")
                .paragraphBold()
                .foregroundColor(.primary_color)
                .padding(.bottom, 5)

            Text("Messtex UG\nHopfenweg 21\n85276 Pfaffenhofen")
                .paragraph()



            Spacer()
        }
        .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 0))
        .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Contact", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            {
                btnBack
            }
        }
    }

}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
