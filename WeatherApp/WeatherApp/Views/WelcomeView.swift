//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Jabir on 21/02/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationHandler: LocationHandler
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome back!")
                    .bold().font(.title)
                
                Text("Share your location to find the weather in your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            LocationButton(.shareCurrentLocation) {
                locationHandler.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    WelcomeView()
}
