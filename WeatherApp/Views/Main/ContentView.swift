//
//  ContentView.swift
//  WeatherApp
//
//  Created by Karimov Dilmurod on 20/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
