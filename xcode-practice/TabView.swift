//
//  TabView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct MyView: View {
  var title: String
  var bgColor: Color
  
  var body: some View {
    ZStack {
      bgColor.edgesIgnoringSafeArea(.all)
      Text(title)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundColor(.white)
    }
  }
}

struct TabViewA: View {
  var body: some View {
    TabView {
      MyView(title: "People", bgColor: Color.red)
        .tabItem {
          Image(systemName: "person.fill")
          Text("People")
        }
        .tag(0)
      MyView(title: "Home", bgColor: Color.yellow)
        .tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }
        .tag(1)
      MyView(title: "Settings", bgColor: Color.blue)
        .tabItem {
          Image(systemName: "gear")
          Text("Settings")
        }
        .tag(2)
    }
    .onAppear {
      // correct the transparency bug for Tab bars
      let tabBarAppearance = UITabBarAppearance()
      tabBarAppearance.configureWithOpaqueBackground()
      UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
      // correct the transparency bug for Navigation bars
      let navigationBarAppearance = UINavigationBarAppearance()
      navigationBarAppearance.configureWithOpaqueBackground()
      UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    } // source: https://www.hackingwithswift.com/forums/ios/tab-bar-transparent/10549
  }
}

#Preview {
  TabViewA()
}
