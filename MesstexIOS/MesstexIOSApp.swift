//
//  MesstexIOSApp.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24/05/2021.
//

import OSLog
import SwiftUI
import UIKit
import OSLog
import LanguageManagerSwiftUI
@main
struct MesstexIOSApp: App {
     
    
    private var viewModel = MainViewModel()
    @AppStorage("currentLocale") var currentLocale: String = "English"
    
    init() {
        viewModel.language = currentLocale
        
        viewModel.getCO2Levels()
        viewModel.getFAQs()
    }

    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some Scene {
        WindowGroup {
            LanguageManagerView(.deviceLanguage) {
                MainView(viewModel: viewModel, language: $currentLocale)
                        .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                        .onReceive(timer){ time in
                            viewModel.getCO2Levels()
                    }
            }
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true // set to `false` if you don't want to detect tap during other gestures
    }
}
