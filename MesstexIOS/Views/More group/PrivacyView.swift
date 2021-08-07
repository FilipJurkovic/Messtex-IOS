//
//  PrivacyView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI

struct PrivacyView: View {
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
                Text("Headline")
                    .heading2()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 14)
                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.")
                    .paragraph()
                    .padding(.bottom, 43)

                Text("Subheadline")
                    .paragraphBold()
                    .foregroundColor(.primary_color)
                    .padding(.bottom, 10)

                Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim.")
                    .paragraph()

                Spacer()
            }
            .padding(.init(top: 25, leading: 24, bottom: 0, trailing: 24))
            .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Privacy", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    btnBack
                        .foregroundColor(.dark)
                }
            }
        }
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
