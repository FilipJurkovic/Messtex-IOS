//
//  VideoView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 17.08.2021..
//

import SwiftUI

struct VideoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            Color.dark
            ZStack{
                Image("video_image")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width, height: 211)
            }
              
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width, alignment: .topLeading)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.presentationMode.wrappedValue.dismiss()
        }){
            RoundButtonStyle(imageName: "xmark", backgroundColor: .tetriary_tint, iconColor: .dark)
        })
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
