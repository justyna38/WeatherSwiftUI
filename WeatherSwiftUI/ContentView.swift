//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Justyna Warzecha on 17/11/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Grenoble, Fr")
                
                NowWeather(image: isNight ? "moon.fill" : "cloud.sun.fill", temperature: isNight ? 14 : 20)
                HStack(spacing: 20){
                    WeatherDayView(daysOfWeek: "Lun", imageName: isNight ? "cloud.moon.bolt.fill" : "sun.max.fill", temperature: isNight ? 10 : 12)
                    WeatherDayView(daysOfWeek: "Mar", imageName: "wind.snow", temperature: isNight ? 11 : 15)
                    WeatherDayView(daysOfWeek: "Mer", imageName: isNight ? "cloud.moon.fill" : "cloud.bolt.rain.fill", temperature: isNight ? 13 :  16)
                    WeatherDayView(daysOfWeek: "Jeu", imageName: isNight ? "cloud.moon.rain.fill" : "cloud.bolt.fill", temperature: isNight ? 9 : 15)
                    WeatherDayView(daysOfWeek: "Ven", imageName: isNight ? "cloud.moon.rain.fill" :  "cloud.bolt.fill", temperature: isNight ? 7 : 10)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    ButtonView(textButton: "Change Day Time",  textColor: .blue, backgroundColor: .white)
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
    var daysOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(daysOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    //var topColor: Color
    //var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct ButtonView: View {
    var textButton: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
            Text(textButton)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

struct NowWeather: View {
    var image: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)" + "°C")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}
