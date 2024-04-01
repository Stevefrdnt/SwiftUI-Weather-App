//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by steven ferdianto on 01/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Weather App")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
