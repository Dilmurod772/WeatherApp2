//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Karimov Dilmurod on 20/09/22.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchableText = ""
    var searchResults: [Forecast] {
        if searchableText.isEmpty{
            return Forecast.cities
        }else{
            return Forecast.cities.filter{ $0.location.contains(searchableText)
                
            }
        }
    }
    var body: some View {
        ZStack{
            //MARK: Background
            Color.background
                .ignoresSafeArea()
            
            //MARK: Weather Widgets
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(searchResults){forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top){
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            //MARK: Navigation Bar
            NavigationBar(searchText: $searchableText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchableText, placement: .navigationBarDrawer(displayMode: .always),prompt: "Search for a city or airport")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
