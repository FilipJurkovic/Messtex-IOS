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
            }) {
                HStack {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.dark)
                }
            }
        })
    }

    var body: some View {
            VStack(alignment:.leading){
                ZStack{
                    HStack{
                        btnBack
                            .frame(width: 44, height: 44)
                            .offset(x:-10)
                        
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text(LocalizedStringKey("Contact"))
                            .heading2()
                            .foregroundColor(.primary_color)
                        Spacer()
                    }
                }.padding(.bottom, 26)
                
                Text(LocalizedStringKey("ContactTitle"))
                    .heading2()
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
            ToolbarItem(placement: .navigationBarLeading) {
                btnBack
            }
            .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }

}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
