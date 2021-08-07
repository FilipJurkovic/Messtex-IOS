//
//  OnboardingPageTemplate.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 03.08.2021..
//

import SwiftUI

struct OnboardingPageTemplate: View {
    let image: String
    let title: String
    let description: String
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: 311, height: 400)
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 34, trailing: 0))
            
            Text(LocalizedStringKey(title))
                .heading1()
                .foregroundColor(.primary_color)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 58.5)
                .padding(.bottom, 14)
            
            Text(LocalizedStringKey(description))
                .paragraph()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 44.5)
                .foregroundColor(.dark)
            
            Spacer()
        }.frame(width:UIScreen.main.bounds.size.width, alignment:.top)
    }
}

struct OnboardingPageTemplate_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageTemplate(image: "onboarding_one", title: "Record meter\nreading", description: "Enter the readings of your water and heating\nmeters conveniently online.")
    }
}
