////
////  CameraView.swift
////  MesstexIOS
////
////  Created by Filip Jurković on 23.07.2021..
////
//// Copyright (c) 2015-2021 pixolus GmbH, Germany
////
//// Permission is hereby granted, free of charge, to any person obtaining a copy
//// of this software and associated documentation files (the "Software"), to deal
//// in the Software without restriction, including without limitation the rights
//// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//// copies of the Software, and to permit persons to whom the Software is
//// furnished to do so, subject to the following conditions:
////
//// The above copyright notice and this permission notice shall be included in
//// all copies or substantial portions of the Software.
////
//// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//// THE SOFTWARE.
////
//import SwiftUI
//import MeterReading
//import AVKit
//
//// adapted from https://stackoverflow.com/a/57295284
//struct CameraView: UIViewRepresentable {
//
//    // results are delivered on capture
//    var captureAction: (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void
//
//    var viewModel: MainViewModel
//
//    var reader: PIXMeterReadingView = PIXMeterReadingView()
//
//    var isFlashOn: Binding<Bool> {
//        return Binding(
//            get: {
//                self.reader.isTorchOn
//            }, set: {
//                print("flash is binded")
//                self.reader.isTorchOn = $0
//            }
//        )
//    }
//
//    func manualCapture() {
//        reader.initiateManualCapture()
//    }
//
//    func stopProcessing(){
//        reader.stopProcessing()
//    }
//
//    func startProcessing(){
//        reader.startProcessing()
//    }
//
//    func makeUIView(context: Context) -> PIXMeterReadingView {
//        print("HasTorch: \(reader.hasTorch)")
//
//        let configuration = viewModel.currentReadingView == .testingView ? viewModel.testMeterConfiguration : viewModel.userData.meters[viewModel.currentMeterIndex].configuration
//        reader.zoom = 1.3
//        reader.meterAppearance = viewModel.getCounterType(type: configuration.meterAppearance)
//        reader.fractionDigits = configuration.fractionDigitsAuto ? PIXAutomatic : configuration.fractionDigits!
//        reader.integerDigits = configuration.integerDigitsAuto ? PIXAutomatic : configuration.integerDigits!
//        reader.numberOfCounters = configuration.numberOfCountersAuto ? PIXAutomatic : configuration.numberOfCounters!
////        reader.isTorchOn = true
//
//        print(reader.integerDigits)
//        print(reader.fractionDigits)
//        print(reader.numberOfCounters)
//        print(reader.timeout)
//        print(reader.timeoutAfterLastDetection)
//        print(reader.timeoutUnreadableCounter)
//        print(reader.zoom)
//        print(reader.isResultsOverlayVisible)
//
//        return reader
//    }
//
//    func updateUIView(_ uiView: PIXMeterReadingView, context: Context) {
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(reader: reader, callback: { results, image in
//            let resultStrings = results.map {$0.cleanReadingString()}
//            let rawStrings = results.map {$0.rawReadingString()}
//            let resultCodes = results.map {($0.status())}
//            captureAction(image, resultStrings, rawStrings, resultCodes)
//        }, viewModel: viewModel)
//    }
//
//    class Coordinator: NSObject, PIXMeterReadingViewDelegate {
//        var callback: ([PIXMeterReadingResult], UIImage) -> Void
//
//        var viewModel: MainViewModel
//
//        func meterReadingView(_ meterReadingView: PIXMeterReadingView, didScanReadings readingResults: [PIXMeterReadingResult], in image: UIImage, metadata: PIXMetadata) {
//            meterReadingView.stopProcessing()
//            self.callback(readingResults, image)
//        }
//
//        func cameraView(_ cameraView: PIXCameraView, didScanBarcodes barcodeResults: [PIXBarcodeReadingResult], in image: UIImage, metadata: PIXMetadata) {
//            // TODO: handle barcode scanning result
//        }
//
//        func startProcessing() {
//            self.startProcessing()
//        }
//
//        init(reader: PIXMeterReadingView, callback: @escaping ([PIXMeterReadingResult], UIImage) -> Void, viewModel: MainViewModel) {
//            self.callback = callback
//            self.viewModel = viewModel
//            super.init()
//            reader.delegate = self
//        }
//    }
//}


//
// CameraView.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015-2021 pixolus GmbH, Germany
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// Created by Markus Beermann on 16.04.21.
//

import SwiftUI
import MeterReading


// adapted from https://stackoverflow.com/a/57295284
struct CameraView: UIViewRepresentable {

    var fractionConfig: Int
    var integerConfig: Int
    var numberOfCountersConfig: Int
    var meterAppearanceConfig: PIXMeterAppearance
    // results are delivered on capture
    var captureAction: (UIImage, [String], [String], [PIXMeterReadingResultStatus]) -> Void
    
    var reader: PIXMeterReadingView = PIXMeterReadingView()
        
    var isFlashOn: Binding<Bool> {
        return Binding(
                    get: {
                        self.reader.isTorchOn
                    }, set: {
                        self.reader.isTorchOn = $0
                    }
                )
    }
    
    func manualCapture() {
        reader.initiateManualCapture()
    }

    func makeUIView(context: Context) -> PIXCameraView {
        
        reader.zoom = 1.3
        reader.meterAppearance = meterAppearanceConfig
        reader.fractionDigits = fractionConfig
        reader.integerDigits = integerConfig
        reader.numberOfCounters = numberOfCountersConfig
        
        print(reader.integerDigits)
        print(reader.fractionDigits)
        print(reader.numberOfCounters)
        print(reader.timeout)
        print(reader.timeoutAfterLastDetection)
        print(reader.timeoutUnreadableCounter)
        print(reader.zoom)
        print(reader.isResultsOverlayVisible)
        print(reader.hasTorch)
        
        return reader
    }
    
    func updateUIView(_ uiView: PIXCameraView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(reader: reader, callback:   { results, image in
            let resultStrings = results.map {$0.cleanReadingString()}
                        let rawStrings = results.map {$0.rawReadingString()}
                        let resultCodes = results.map {($0.status())}
                        captureAction(image, resultStrings, rawStrings, resultCodes)
                                                } )
    }
    
    class Coordinator: NSObject, PIXMeterReadingViewDelegate {
        func meterReadingView(_ meterReadingView: PIXMeterReadingView, didScanReadings readingResults: [PIXMeterReadingResult], in image: UIImage, metadata: PIXMetadata) {
            meterReadingView.stopProcessing()
            self.callback(readingResults, image)
        }
        
        var callback: ([PIXMeterReadingResult], UIImage) -> Void
        
        func cameraView(_ cameraView: PIXCameraView, didScanBarcodes barcodeResults: [PIXBarcodeReadingResult], in image: UIImage, metadata: PIXMetadata) {
            // TODO: handle barcode scanning result
        }
        
        init(reader : PIXMeterReadingView, callback: @escaping ([PIXMeterReadingResult], UIImage) -> Void){
            self.callback = callback
            super.init()
            reader.delegate = self
        }
    }
}
