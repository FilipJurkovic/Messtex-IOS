//
//  InfoView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24.07.2021..
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var viewModel : MainViewModel
    
    var index : Int
    var body: some View {
        VStack(spacing:0){
            HStack{
                Spacer()
                Button(action : {viewModel.isInfoSheetOpen = false}){
                    ExitButtonStyle()
                }
            }
            .padding(.bottom, 25)
            .padding(.top, 20)
            
            Text(LocalizedStringKey("InfoTitle"))
                .heading1()
                .multilineTextAlignment(.center)
                .foregroundColor(.primary_color)
                .padding(.bottom, 36.4)
            
            if viewModel.counterImage != nil{
            
                Image(uiImage: UIImage(data: viewModel.counterImage!)!)
                .resizable()
                .frame(width: 287.32, height: 240.68)
                .padding(.bottom, 33)}
            else{
                Image("watermeter_illustration")
                    .resizable()
                    .frame(width: 287.32, height: 240.68)
                    .padding(.bottom, 33)
            }
            
            HStack{
                Text(LocalizedStringKey("MeterNumber"))
                    .paragraphBold()
                    .foregroundColor(.primary_color)
                Spacer()
            }.padding(.bottom, 10)
            
            HStack{
            Text(viewModel.userData.meters[viewModel.currentMeterIndex].counterDescriptionText)
                .paragraph()
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 24)
            
            Spacer()
            }
        }.padding(.horizontal, 23)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel: MainViewModel(), index: 0)
    }
}
