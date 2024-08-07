//
//  CardView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      VStack(alignment: .leading) {
//        HStack {
//          Image(systemName: "menucard.fill")
//            .font(.title)
//          Spacer()
//          Image(systemName: "person.circle")
//            .font(.largeTitle)
//        }
//        .padding(.horizontal, 20)
//        .padding(.bottom, 3)
        
        Text("CardView")
          .font(.system(size: 36))
          .fontWeight(.black)
          .padding(.horizontal, 20)
        
        ScrollView {
          VStack {
            BigCard()
            SmallCard(icon: "flag.fill", title: "Flag", content: "Up", bgColor: Color.green)
            SmallCard(icon: "tray.fill", title: "Tray", content: "Trays", bgColor: Color.blue)
            SmallCard(icon: "sun.max.fill", title: "Sun", content: "Sunny", bgColor: Color.orange)
            SmallCard(icon: "cloud.moon.rain", title: "Weather", content: "Cloudy, Rainy, Moon", bgColor: Color.yellow)
            SmallCard(icon: "flag.fill", title: "Title", content: "Content", bgColor: Color.green)
            SmallCard(icon: "tray.fill", title: "Tray", content: "Trays", bgColor: Color.blue)
            SmallCard(icon: "sun.max.fill", title: "Sun", content: "Sunny", bgColor: Color.orange)
            SmallCard(icon: "cloud.moon.rain", title: "Weather", content: "Cloudy, Rainy, Moon", bgColor: Color.yellow)
            
          }
          .padding(.horizontal, 20)
        }
      }
      .padding(.top, 20)
      
      Circle()
        .foregroundColor(Color.black)
        .frame(width: 60, height: 60)
        .overlay(
          Image(systemName: "plus")
            .font(.system(size: 35))
            .foregroundColor(Color.white)
        )
        .padding(.trailing, 10)
        .shadow(radius: 20)
    }
  }
}

#Preview {
  CardView()
}
