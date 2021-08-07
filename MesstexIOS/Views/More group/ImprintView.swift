//
//  ImprintView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct ImprintView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
            VStack(alignment:.leading) {
                Group {
                    Text(LocalizedStringKey("ImprintInformation"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)

                    Text("Messtex UG\nHopfenweg 21\n85276 Pfaffenhofen")
                        .paragraph()
                        .padding(.bottom, 23)

                    Text(LocalizedStringKey("ImprintRepresentedBy"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)

                    Text("Julia Berger-Bauer")
                        .paragraph()
                        .padding(.bottom, 23)

                    Text(LocalizedStringKey("Contact"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)
                    Button(action: {
                        EmailHelper.shared.send(subject: "Information request", body: "", to: ["support@messtex.de"])

                    }, label: {
                        Text("info@messtex.de")
                            .underline()
                            .paragraph()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 23)

                    })

                    Text(LocalizedStringKey("ImprintSalesTaxTitle"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)

                    Text(LocalizedStringKey("ImprintSalesTaxText"))
                        .paragraph()
                        .padding(.bottom, 23)

                    Text(LocalizedStringKey("ImprintResponsibilityTitle"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)

                    Text(LocalizedStringKey("ImprintResponsibilityText"))
                        .paragraph()
                        .padding(.bottom, 23)

                }
                Group {
                    Text(LocalizedStringKey("ImprintDisclamerTitle"))
                        .heading2()
                        .foregroundColor(.primary_color)
                        .padding(.bottom, 16)

                    Text(LocalizedStringKey("ImprintDisclamerText"))
                        .paragraph()
                        .padding(.bottom, 23)
                }

                Spacer()
            }
            .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Contact", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                        .foregroundColor(.dark)
                }
            }
        }
    }
}

struct ImprintView_Previews: PreviewProvider {
    static var previews: some View {
        ImprintView()
    }
}
