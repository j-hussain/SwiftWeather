//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jabir on 21/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationHandler = LocationHandler()
    var weatherAPI = WeatherAPI()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationHandler.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherAPI.getWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else
            {
                if locationHandler.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationHandler)
                }
            }
        }
        .background(Color(hue: 0.681, saturation: 0.977, brightness: 0.439))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
