//
//  ContentView.swift
//  teset
//
//  Created by minn on 8/4/24.
//

import SwiftUI

struct NavigationLinkButton<Destination: View>: View {
    let destination: Destination
    let label: String

    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(.tint)
                .cornerRadius(20)
        }
    }
}

struct ContentView: View {
  @State private var isActivated: Bool = false
  
  var body: some View {
    NavigationView {
      VStack(spacing: 10) {
        VStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
          Text("Hello, world!")
            .font(.system(size: 40, design: .rounded))
            .fontWeight(.heavy)
        }
        .padding()
        ScrollView {
          NavigationLinkButton(destination: TextFieldView(), label: "TextFieldView")
          NavigationLinkButton(destination: ButtonView(), label: "ButtonView")
          NavigationLinkButton(destination: TabViewA(), label: "TabView")
          NavigationLinkButton(destination: GeometryReaderView(), label: "GeometryReaderView")
          NavigationLinkButton(destination: ListView(), label: "ListView")
          NavigationLinkButton(destination: CardView(), label: "CardView")
          NavigationLinkButton(destination: StackView(), label: "StackView")
          NavigationLinkButton(destination: WebView(url: "https://google.com"), label: "WebView")
          NavigationLinkButton(destination: TextView(isActivated: $isActivated), label: "TextView")
        }
      }
      .containerRelativeFrame([.horizontal, .vertical])
      .background(!isActivated ? Color.white : Color(hex: 0xd8a1fb))
      .navigationBarHidden(true)
      .navigationBarTitle("ContentView")
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
