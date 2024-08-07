//
//  ButtonView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
  var color: Color
  enum ButtonType {
    case single, long, rotate, blur
  }
  var type: ButtonType
  
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .font(.system(size: 18))
      .fontWeight(.bold)
      .foregroundColor(.white)
      .padding()
      .background(color)
      .cornerRadius(20)
      .onTapGesture {
        if (self.type == .single) {
          let haptic = UIImpactFeedbackGenerator(style: .light)
          haptic.impactOccurred()
        }
      }
      .onLongPressGesture {
        if (self.type == .long) {
          let haptic = UIImpactFeedbackGenerator(style: .heavy)
          haptic.impactOccurred()
        }
      }
      .scaleEffect(self.type != .rotate && self.type != .long && configuration.isPressed ? 0.9 : 1.0)
      .scaleEffect(self.type != .rotate && self.type == .long && configuration.isPressed ? 0.5 : 1.0)
      .rotationEffect(self.type == .rotate && configuration.isPressed ? .degrees(360) : .degrees(0)).animation(.default)
      .blur(radius: self.type == .blur && configuration.isPressed ? 30 : 0)
  }
}

struct ButtonView: View {
  var body: some View {
    VStack(spacing: 60) {
      Button(action: {
        print("Click!")
      }, label: {
        Text("SingleButton")
      }).buttonStyle(CustomButtonStyle(color: Color.blue, type: .single))
      
      Button(action: {
        print("Click!")
      }, label: {
        Text("LongButton")
      }).buttonStyle(CustomButtonStyle(color: Color.green, type: .long))
      
      Button(action: {
        print("Click!")
      }, label: {
        Text("RotateButton")
      }).buttonStyle(CustomButtonStyle(color: Color.yellow, type: .rotate))
      
      Button(action: {
        print("Click!")
      }, label: {
        Text("BlurButton")
      }).buttonStyle(CustomButtonStyle(color: Color.orange, type: .blur))
    }
    .navigationBarTitle("ButtonView", displayMode: .large)
  }
}

#Preview {
  ButtonView()
}
