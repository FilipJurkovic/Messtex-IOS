//
//  ExampleView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 22.07.2021..
//

import SwiftUI

struct ExampleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Color.dark
            ZStack {
                Image("example_brief")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width, height: 535)
            }
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            RoundButtonStyle(imageName: "xmark", backgroundColor: .tetriary_tint, iconColor: .dark)
        })
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
