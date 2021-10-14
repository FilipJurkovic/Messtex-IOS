//
//  ContentView.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 24/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
struct ContentView2: View {
    var body: some View {
        Text("Hello, world1!")
            .padding()
    }
}
struct ContentView3: View {
    var body: some View {
        Text("Hello, world2!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView2()
            ContentView3()

        }
    }
}
