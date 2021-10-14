//
//  LegalView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 28.08.2021..
//

import SwiftUI

struct LegalView: View {
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
                            Text(LocalizedStringKey("Legal"))
                                .heading2()
                                .foregroundColor(.primary_color)
                            Spacer()
                        }
                    }.padding(.bottom, 26)

                    Group {
                        Text(LocalizedStringKey("ImprintInformation"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text("Messtex GbR\nSchießstattstr. 14a\n84072 Au i.d. Hallertau")
                            .paragraph()
                            .padding(.bottom, 23)

                        Text(LocalizedStringKey("ImprintRepresentedBy"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text("Julia Berger-Bauer\nJonas Berger")
                            .paragraph()
                            .padding(.bottom, 23)

                        Text(LocalizedStringKey("Contact"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text("Schießstattstraße 14a\n84072 Au in der Hallertau")
                            .paragraph()
                            .padding(.bottom, 5)

                        Text("Phone: 0151/41888186\nE-Mail: info@messtex.de")
                            .paragraph()
                            .padding(.bottom, 23)

                        Text(LocalizedStringKey("ImprintSalesTaxTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text(LocalizedStringKey("ImprintSalesTaxText"))
                            .paragraph()
                            .padding(.bottom, 23)

                    }
                    Group {

                        Text(LocalizedStringKey("ImprintResponsibilityTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text(LocalizedStringKey("ImprintResponsibilityText"))
                            .paragraph()
                            .padding(.bottom, 23)

                        Text(LocalizedStringKey("ImprintDisclamerTitle"))
                            .heading2()
                            .foregroundColor(.primary_color)
                            .padding(.bottom, 16)

                        Text(LocalizedStringKey("ImprintDisclamerText"))
                            .paragraph()
                            .padding(.bottom, 50)
                    }

                    Spacer()
                }
                .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
                .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)

            }
        }
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}
