//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by steven ferdianto on 01/04/24.
//

import SwiftUI

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            ScrollView {
                VStack(spacing: 14) {
                    WeatherHeaderView()
                    
                    Spacer(minLength: 24)
                    
                    HStack(alignment: .center) {
                        WeatherByTimeView(
                            time: "17:00",
                            icon: "cloud.heavyrain.fill",
                            temperature: 27
                        )
                        Spacer()
                        WeatherByTimeView(
                            time: "18:00",
                            icon: "cloud.bolt.rain.fill",
                            temperature: 26
                        )
                        Spacer()
                        WeatherByTimeView(
                            time: "19:00",
                            icon: "cloud.drizzle.fill",
                            temperature: 26
                        )
                        Spacer()
                        WeatherByTimeView(
                            time: "20:00",
                            icon: "cloud.moon.fill",
                            temperature: 26
                        )

                    }
                    .padding()
                    .foregroundStyle(.ultraThickMaterial)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16 ))
                    .blendMode(.hardLight)
                    
                    WeatherByDayListView()
                    
                    VStack {
                        Text("AQI")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundStyle(.white)
                        
                        Gauge(value: 92, in: 0...500) {
                            Text("Moderate (92)")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                        }
                        .gaugeStyle(.linearCapacity)
                        .tint(Gradient(colors: [.green, .yellow, .orange, .red]))
                    }
                    .padding()
                    .foregroundStyle(.ultraThickMaterial)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16 ))
                    .blendMode(.hardLight)
                    
                    LazyVGrid(columns: columns) {
                        WeatherMetricView(
                            title: "UV Index",
                            value: "Very High",
                            icon: "sun.max.fill")
                        WeatherMetricView(
                            title: "Humidity",
                            value: "68%",
                            icon: "humidity.fill")
                        WeatherMetricView(
                            title: "Wind", 
                            value: "8 km/h",
                            icon: "wind")
                        WeatherMetricView(
                            title: "Dew Point", 
                            value: "25°",
                            icon: "drop.degreesign.fill")
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 20))
                
            }
        }
    }
}

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 20/255, green: 32/255, blue: 84/255),
                Color(red: 81/255, green: 95/255, blue: 158/255)
            ]),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        ).ignoresSafeArea()
    }
}

struct WeatherHeaderView: View {
    var body: some View {
        HStack {
            Text("Jakarta")
                .font(.system(size: 32, weight: .semibold, design: .default))
                .foregroundStyle(.white)
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
        }
        HStack {
            VStack {
                Text("28°")
                    .font(.system(size: 80, weight: .semibold, design: .default))
                    .foregroundStyle(.white)
                Text("Light Rain")
                    .font(.system(size: 26, weight: .semibold, design: .default))
                    .foregroundStyle(.white)
            }
            Spacer()
            Image(systemName: "cloud.drizzle.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
        }
    }
}

struct WeatherByTimeView: View {
    let time:String
    let icon:String
    let temperature:Int
    
    var body: some View {
        VStack {
            Text(time)
                .font(.system(size: 20, weight: .medium, design: .default))
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .semibold, design: .default))
        }.foregroundStyle(.white)
    }
}

struct WeatherByDayListView: View {
    var body: some View {
        Grid(verticalSpacing: 20) {
            WeatherByDayListItemView(
                day: "Today",
                humidity: 92,
                morningWeatherIcon: "cloud.heavyrain.fill",
                nightWeatherIcon: "cloud.moon.rain.fill",
                temperature: 30
            )
            WeatherByDayListItemView(
                day: "Monday",
                humidity: 69,
                morningWeatherIcon: "cloud.bolt.rain.fill",
                nightWeatherIcon: "cloud.moon.rain.fill",
                temperature: 30
            )
            WeatherByDayListItemView(
                day: "Tuesday",
                humidity: 63,
                morningWeatherIcon: "cloud.fill",
                nightWeatherIcon: "cloud.moon.fill",
                temperature: 30
            )
            WeatherByDayListItemView(
                day: "Wednesday",
                humidity: 24,
                morningWeatherIcon: "cloud.sun.fill",
                nightWeatherIcon: "cloud.moon.fill",
                temperature: 30
            )
            WeatherByDayListItemView(
                day: "Thursday",
                humidity: 51,
                morningWeatherIcon: "cloud.sun.fill",
                nightWeatherIcon: "cloud.moon.fill",
                temperature: 30
            )
            WeatherByDayListItemView(
                day: "Friday",
                humidity: 31,
                morningWeatherIcon: "sun.max.fill",
                nightWeatherIcon: "smoke.fill",
                temperature: 30
            )
            
        }
//        .foregroundStyle(.white)
        .padding()
        .foregroundStyle(.ultraThickMaterial)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16 ))
        .blendMode(.hardLight)
    }
}

struct WeatherByDayListItemView: View {
    let day:String
    let humidity:Int
    let morningWeatherIcon:String
    let nightWeatherIcon:String
    let temperature:Int
    
    var body: some View {
        GridRow {
            Text(day)
                .font(.system(size: 22, weight: .bold, design: .default))
                .gridColumnAlignment(.leading)
            Spacer()
            Image(systemName: "drop.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            Text("\(humidity)%")
                .font(.system(size: 20, weight: .medium, design: .default))
            Spacer()
            Image(systemName: morningWeatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
            Image(systemName: nightWeatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            Spacer()
            Text("\(temperature)°")
                .font(.system(size: 22, weight: .bold, design: .default))
        }
    }
}

struct WeatherMetricView: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundStyle(.white)
            }
            
            Text(value)
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundStyle(.white)
        }
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            alignment: .topLeading
        )
        .padding()
        .foregroundStyle(.ultraThickMaterial)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16 ))
        .blendMode(.hardLight)
        
    }
}

#Preview {
    ContentView()
}


