//
//  ReadingFlowEnum.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 02.08.2021..
//

import Foundation

enum ReadingFlowEnum: CaseIterable {
    case codeReadingView
    case readingStepsView
    case meterReadingView
    case manualReadingView
    case contactDetailsView
    case confirmationView
    case successView
    case exampleView
    case videoView
    case testingView
    case testMeterPopup
    case testFinalPopup

    static func index(of aStatus: ReadingFlowEnum) -> Int {
        let elements = [ReadingFlowEnum.codeReadingView, ReadingFlowEnum.readingStepsView, ReadingFlowEnum.meterReadingView, ReadingFlowEnum.manualReadingView, ReadingFlowEnum.contactDetailsView, ReadingFlowEnum.confirmationView, ReadingFlowEnum.successView, ReadingFlowEnum.exampleView, ReadingFlowEnum.videoView]

        return elements.index(of: aStatus)!
    }

    static func element(at index: Int) -> ReadingFlowEnum? {
        let elements = [ReadingFlowEnum.codeReadingView, ReadingFlowEnum.readingStepsView, ReadingFlowEnum.meterReadingView, ReadingFlowEnum.manualReadingView, ReadingFlowEnum.contactDetailsView, ReadingFlowEnum.confirmationView, ReadingFlowEnum.successView, ReadingFlowEnum.exampleView, ReadingFlowEnum.videoView]

        if index >= 0, index < elements.count {
            return elements[index]
        } else {
            return nil
        }
    }
}
