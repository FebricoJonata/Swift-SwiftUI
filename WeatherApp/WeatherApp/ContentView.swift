//
//  ContentView.swift
//  WeatherApp
//
//  Created by Febrico Jonata on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColorView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color(red: 173/255, green: 216/255, blue: 230/255))
            VStack(){
                Text("Jakarta")
                    .font(.system(size: 34, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                MainTemprature(mainIcon: isNight ? "moon.stars.fill" : "cloud.sun.fill", temprature: 38)
                
                HStack(spacing: 10){
                    WeatherDayView(day: "TUE", image: isNight ? "wind" : "cloud.sun.fill", temprature: 39)
                    WeatherDayView(day: "WED", image: isNight ? "moon.fill" : "sun.max.fill", temprature: 38)
                    WeatherDayView(day: "THU", image: isNight ? "sparkles" : "wind", temprature: 37)
                    WeatherDayView(day: "FRI", image: isNight ? "cloud.moon.rain.fill" : "sunset.fill", temprature: 38)
                    WeatherDayView(day: "SAT", image: isNight ? "cloud.bolt.fill" : "cloud.rain.fill", temprature: 36)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day: String?
    var image: String?
    var temprature: Int?
    
    var body: some View {
        VStack {
            Text(day!)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: image!)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temprature!)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
        }.padding(6)
    }
}

struct BackgroundColorView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainTemprature: View {
    var mainIcon: String
    var temprature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: mainIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180).padding(8)
            
            Text("\(temprature)°").font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}



