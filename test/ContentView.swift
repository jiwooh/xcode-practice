//
//  ContentView.swift
//  teset
//
//  Created by minn on 8/4/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isActivated: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
          Text("Hello, world!")
            .font(.system(size: 40, design: .rounded))
            .fontWeight(.heavy)
        }
        .padding()
        NavigationLink(destination: TextView(isActivated: $isActivated)) {
          Text("TextView")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(.tint)
            .cornerRadius(8)
            .padding(10)
        }
        NavigationLink(destination: WebView(url: "https://google.com")) {
          Text("WebView")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(.tint)
            .cornerRadius(8)
            .padding(10)
        }
      }
      .containerRelativeFrame([.horizontal, .vertical])
      .background(isActivated ? Color.white : Color(hex: 0xd8a1fb))
    }
    .onTapGesture {
      self.isActivated.toggle()
    }
  }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255
        let green = Double((hex >> 8) & 0xff) / 255
        let blue = Double((hex >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

#Preview {
  ContentView()
}
