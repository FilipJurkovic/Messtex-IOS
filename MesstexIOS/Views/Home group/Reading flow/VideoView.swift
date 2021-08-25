//
//  VideoView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 17.08.2021..
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel : MainViewModel
    
    var body: some View {
        ZStack{
            Color.dark
            
            Image("video_image")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width, height: 211)
            
            VStack{
                HStack{
                    Button(action : {
                    withAnimation(.easeInOut){
                        viewModel.currentReadingView = viewModel.previousReadingView
                    }}){ ExitButtonStyle() }
                    Spacer()
                }
                Spacer()
            }.padding(.top, 13)
             .padding(.leading, 24)

        }.frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
         .navigationBarBackButtonHidden(true)
         .navigationTitle("")
         .navigationBarHidden(true)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(viewModel: MainViewModel())
    }
}
