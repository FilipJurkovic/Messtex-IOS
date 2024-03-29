//
//  MoreView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 16.07.2021..
//

import SwiftUI
import LanguageManagerSwiftUI

struct MoreView: View {
    @ObservedObject var viewModel : MainViewModel
    @Binding var shouldShowOnboarding : Bool
    
    @EnvironmentObject var languageSettings: LanguageSettings
    
    var body: some View {
                ScrollView(showsIndicators: false) {
                VStack() {
                    ZStack(alignment:.bottom){
                        Image("more_top")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width)
                            .offset(y: -290)
                            .padding(.bottom, -219)
                        
                        Image("logo_start")
                            .resizable()
                            .frame(width: 142, height: 142)
                        }
                    
                    AboutUsCardWidget()
                        .padding(.init(top: 20, leading: 0, bottom: 38, trailing: 0))
                        
                    
                    Group{
                        
                       Group{
                            Button(action: {viewModel.isLanguagePickerShowing.toggle()
                            }, label: {
                                LanguageSelector(cardName: "Language", language: viewModel.language)
                            })
                            
                            Divider().padding(.horizontal, 20)
                                .frame(height:3)
                        
                       }
                        
                        NavigationLink(
                            destination: FaqView(viewModel: viewModel),
                            label: {
                                CardButton(cardName: "Faq")
                            })
                    Divider().padding(.horizontal, 20)
                        .frame(height:3)
                        
                        NavigationLink(
                            destination: ContactView(),
                            label: {
                                CardButton(cardName: "Contact")
                            })
                            .accentColor(.dark)
                    Divider().padding(.horizontal, 20)
                        .frame(height:3)
                        
                        NavigationLink(
                            destination: ContactFormView(viewModel: viewModel),
                            label: {
                                CardButton(cardName: "ContactForm")
                            })
                    Divider().padding(.horizontal, 20)
                        .frame(height:3)
                        
                        NavigationLink(
                            destination: PrivacyView(),
                            label: {
                                CardButton(cardName: "Privacy")
                            })
                    Divider().padding(.horizontal, 20)
                        .frame(height:3)
                        
                        NavigationLink(
                            destination: ImprintView(),
                            label: {
                                CardButton(cardName: "Imprint")
                            })

                        
                    }
                    
                    Rectangle()
                        .frame(height:32)
                        .foregroundColor(.primary_shade)
                        .opacity(0.1)
                    
                    Group{
                        Button(
                            action: {shouldShowOnboarding.toggle()},
                            label: {
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                                Rectangle()
                                    HStack(alignment:.center)
                                {
                                        Text("RestartOnboarding")
                                    .foregroundColor(.dark)
                                    .padding(.leading, 12)
                                   
                                        Spacer()
                                    Image(systemName: "arrow.clockwise")
                                        .frame(width: 14.08, height: 17.12)
                                        .foregroundColor(.dark)
                                        .padding()
                                    }
                            }.frame(width: 351, height:54)
                                .foregroundColor(.light)
                            })
                    Divider().padding(.horizontal, 20)
                        .frame(height:3)
                        
                        Button(
                            action: openShareSheet,
                            label: {
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                                Rectangle()
                                    HStack(alignment:.center)
                                {
                                        Text(LocalizedStringKey("ShareApp"))
                                    .foregroundColor(.dark)
                                    .padding(.leading, 12)
                                        Spacer()
                                    Image("social_icon")
                                        .frame(width: 15.36, height: 16.64)
                                        .foregroundColor(.dark)
                                        .padding()
                                    }
                            }.frame(width: 351, height:54)
                                .foregroundColor(.light)
                            })
                    }
                   
                }.edgesIgnoringSafeArea(.all)
                .padding(.bottom, 40)
                    
                NavigationLink(destination: AboutUsView(), isActive: $viewModel.showAboutPage, label: { EmptyView() })
                    
            }.onAppear(){
                    UITabBar.appearance().isHidden = false
                }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        
    }

    func openShareSheet() {
        guard let urlShare = URL(string: "https://messtex.de/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }

}

struct MoreView_Previews: PreviewProvider {
    
    static var previews: some View {
       
        MoreView(viewModel: MainViewModel(),shouldShowOnboarding: .constant(false))
    }
}
