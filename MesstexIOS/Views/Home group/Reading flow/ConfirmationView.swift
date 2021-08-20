//
//  ConfirmationView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 26.07.2021..
//

import SwiftUI

struct ConfirmationView: View {
    
    @ObservedObject var viewModel : MainViewModel
    var length = 8
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false){
                VStack{
                    HStack{
                        Text(LocalizedStringKey("YourCopy"))
                            .heading2()
                            .foregroundColor(.primary_color)
                        Spacer()
                    }.padding(.horizontal, 24)
                    
                }
                .padding(.top, 100)
                ZStack(){
                    Image("reading_paper")
                        .resizable()
                        .frame(width: 353.3, height: 527.4)
                        .padding(EdgeInsets(top: 24, leading: 0, bottom: 38, trailing: 0))
                        ScrollView(showsIndicators: false){
                            VStack(alignment:.leading){
                                ForEach(0...viewModel.postModelData.meterReadings.count, id: \.self){ index in
                                    VStack(alignment:.leading, spacing:0){
                                        if index != viewModel.postModelData.meterReadings.count {
                                        HStack{
                                   
                                            Image(viewModel.getMeterTypeIcon(meterType: viewModel.postModelData.meterReadings[index].counterType))
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                                .padding(.top, 17)
                                                
                                            Text(viewModel.userData.meters[index].counterTypeName)
                                              .paragraphBold()
                                              .foregroundColor(.primary_color)
                                              .padding(.trailing, 9)
                                            Spacer()
                                        }.padding(.bottom, 4)
                                        Text("Nr. \(viewModel.userData.meters[index].counterNumber)")
                                          .small()
                                          .foregroundColor(.tetriary)
                                          .padding(.bottom, 8)

                                        Text(viewModel.postModelData.meterReadings[index].counterValue)
                                          .paragraphBold()
                                          .foregroundColor(.dark)
                                          .padding(.bottom, 17)
                                            
                                        Divider()
                                            .foregroundColor(.tetriary)
                                            .frame(height:1)
                                    }
                                    
                                    else{
                                        HStack{
                                            Text(LocalizedStringKey("Contact"))
                                              .paragraphBold()
                                              .foregroundColor(.primary_color)
                                              .padding(.trailing, 9)
                                            Spacer()
                                        }.padding(.bottom, 4)
                                        .padding(.top, 17)
                                        Text("\(viewModel.userData.firstName) \(viewModel.userData.lastName)")
                                          .paragraph()
                                          .foregroundColor(.dark)
                                          .padding(.bottom, 8)

                                        Text("\(viewModel.userData.email)")
                                          .paragraph()
                                          .foregroundColor(.dark)
                                          .padding(.bottom, 8)

                                        Text("\(viewModel.userData.street) \(viewModel.userData.houseNumber)")
                                          .paragraph()
                                          .foregroundColor(.dark)
                                          .padding(.bottom, 17)
                                            
                                        Divider()
                                            .foregroundColor(.tetriary)
                                            .frame(height:1)
                                    }
                                }
                            }
                                

                        }.padding(.horizontal, 23)
                        }.frame(width: 300, height: 450)
                        
                }.frame(width: 353.3, height: 527.4)
                Button(action: {viewModel.takeMeterReadings()}, label: {
                    PrimaryButtonStyle(buttonLabel: "Send")
                }).padding(.bottom, 30)
                .padding(.top, 38)

                NavigationLink(destination: SuccessVIew(viewModel: viewModel)
                                .tag(ReadingFlowEnum.successView)
                                .simultaneousGesture(DragGesture()), tag: ReadingFlowEnum.successView, selection: $viewModel.currentReadingView) { EmptyView() }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarHidden(true)
        .frame(height: UIScreen.main.bounds.size.height)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(viewModel: MainViewModel())
    }
}
