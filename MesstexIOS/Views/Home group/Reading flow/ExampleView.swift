//
//  ExampleView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 22.07.2021..
//

import SwiftUI

struct ExampleView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            Color.dark

            Image("example_brief")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width, height: 535)

            VStack {
                HStack {
                    Button(action: {
                            withAnimation(.easeInOut) {
                                viewModel.currentReadingView = viewModel.previousReadingView
                            }}) { ExitButtonStyle() }
                    Spacer()
                }
                Spacer()
            }.padding(.top, 13)
            .padding(.leading, 24)

        }
        .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarHidden(true)
        .statusBar(hidden: true)
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(viewModel: MainViewModel())
    }
}
