//
//  OnboardingFlowView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 21.07.2021..
//

import SwiftUI
import UIKit

struct OnboardingFlowView: View {
    @Binding var shouldShowOnboarding: Bool
    @State var pageIndex: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $pageIndex) {
                OnboardingPageTemplate(image: "onboarding_one", title: "OnboardingTitleOne", description: "OnobardingTextOne")
                    .tag(0)
                OnboardingPageTemplate(image: "onboarding_two", title: "OnboardingTitleTwo", description: "OnobardingTextTwo")
                    .tag(1)
                OnboardingPageTemplate(image: "onboarding_three", title: "OnboardingTitleThree", description: "OnobardingTextThree")
                    .tag(2)
            }.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
            .animation(.linear)
            .onAppear() {
                UIPageControl.appearance().currentPageIndicatorTintColor = .primary
                UIPageControl.appearance().pageIndicatorTintColor = .tetriary
            }
            VStack {
                HStack {
                    Button(action: {shouldShowOnboarding.toggle()}, label: {
                        Text(LocalizedStringKey("Skip"))
                            .underline()
                            .paragraph()
                            .foregroundColor(.primary_color)
                            .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 17))
                    })
                }.frame(width: UIScreen.main.bounds.size.width, alignment: .trailing)
                Spacer()
            }
            HStack {
                Button(action: {
                    if(pageIndex < 2) {
                        pageIndex = pageIndex+1
                    } else {
                        shouldShowOnboarding.toggle()
                    }
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.light)
                            .frame(width: 48, height: 48)
                            .shadow(color: .medium, radius: 2, x: 1, y: 1)
                        Image(systemName: "chevron.right")
                            .frame(width: 7.38, height: 12.92)
                            .foregroundColor(.primary_shade)
                            .padding()

                    }.frame(width: 48, height: 48, alignment: .center)
                })
            }.frame(width: UIScreen.main.bounds.size.width, alignment: .trailing)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 26))

        }
    }
}

struct OnboardingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView(shouldShowOnboarding: .constant(true))
    }
}
