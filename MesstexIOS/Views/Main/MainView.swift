//
//  ContentView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24/05/2021.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel : MainViewModel
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true

    var body: some View {
        NavigationView{
            TabView{
                HomeView(viewModel: viewModel).tabItem { Label("Home", systemImage: "house") }

                MoreView(viewModel: viewModel, shouldShowOnboarding: $shouldShowOnboarding).tabItem { Image(uiImage: UIImage(systemName: "ellipsis")!.imageWithoutBaseline())
                    Text("More")}
            }
            .animation(.easeInOut)
            .transition(.slide)
            .accentColor(.primary_color)
            .overlay(NavigationLink(
                        destination: MeterReadingFlowView(viewModel: viewModel),
                        label : {
                            VStack
                            {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.primary_30)
                                        .frame(width: 56, height:56)
                                        .shadow(radius: 2)
                                    Image("scan_button")
                                        .resizable()
                                        .frame(width: 56, height:56)
                                    Image("scan_icon")
                                        .resizable()
                                        .frame(width: 22, height:17)
                                }
                                Text("Scan")
                                    .foregroundColor(Color.medium)
                                    .tiny()
                            }.offset(y: -1)
                        }),alignment: .bottom)
            .onAppear{
                UITabBar.appearance().backgroundColor = .clear
                UITabBar.appearance().isTranslucent = false
                UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Roboto-Bold", size: 18)!]
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.primary]
                UINavigationBar.appearance().tintColor = .dark
                UINavigationBar.appearance().barTintColor = .light

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)

        }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingFlowView(shouldShowOnboarding: $shouldShowOnboarding)
        })

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
