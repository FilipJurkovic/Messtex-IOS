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

    var nameArray: [LocalizedStringKey] = [LocalizedStringKey("WaterInfoTitle"),LocalizedStringKey("HeaterInfoTitle"),LocalizedStringKey("ElectricityInfoTitle")]
    var imageArray = ["watermeter_illustration","gasmeter_illustration","electricity_illustration"]
    var numberExplanationArray: [LocalizedStringKey] = [LocalizedStringKey("WaterInfoMeterNumber"),LocalizedStringKey("HeaterInfoMeterNumber"),LocalizedStringKey("ElectricityInfoMeterNumber")]
    var readingExplanationArray: [LocalizedStringKey] = [LocalizedStringKey("WaterInfoMeterReading"),LocalizedStringKey("HeaterInfoMeterReading"),LocalizedStringKey("ElectricityInfoMeterReading")]
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Spacer()
                Button(action : {viewModel.isInfoSheetOpen = false}) {
                    RoundButtonStyle(imageName: "xmark", backgroundColor: .tetriary_tint, iconColor: .dark)
                }
            }
            .padding(.bottom, 25)
            .padding(.top, 20)

            Text(nameArray[index])
                .heading1()
                .multilineTextAlignment(.center)
                .foregroundColor(.primary_color)
                .padding(.bottom, 36.4)

            Image(imageArray[index])
                .resizable()
                .frame(width: 287.32, height: 240.68)
                .padding(.bottom, 33)

            HStack {
                Text(LocalizedStringKey("MeterNumber"))
                    .paragraphBold()
                    .foregroundColor(.primary_color)
                Spacer()
            }.padding(.bottom, 10)

            Text(numberExplanationArray[index])
                .paragraph()
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 24)

            HStack {
                Text(LocalizedStringKey("MeterReading"))
                    .paragraphBold()
                    .foregroundColor(.primary_color)
                Spacer()
            }.padding(.bottom, 10)

            Text(readingExplanationArray[index])
                .paragraph()
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 24)

        }.padding(.horizontal, 23)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel: MainViewModel(), index: 0)
    }
}
