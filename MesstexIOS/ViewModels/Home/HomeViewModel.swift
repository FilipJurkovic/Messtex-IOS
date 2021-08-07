//
//  HomeViewModel.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 25/05/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var pageIndex : Page = .pageUserInfo

    func setPage(page: Page){
        pageIndex = page
    }
}
