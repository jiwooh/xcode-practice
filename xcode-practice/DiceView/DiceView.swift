//
//  DiceView.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import Foundation
import SwiftUI

struct DiceView: View {
  @EnvironmentObject var store: DiceStore
  
  @State private var rolled = false
  @State private var press = false
  
  func roll() {
    self.rolled.toggle()
    self.store.dispatch(action: .roll)
  }
  
  var body: some View {
    VStack {
      Text("\(self.store.state.currentDice)")
        .font(.system(size: 200, weight: .bold, design: .rounded))
        .foregroundColor(.red)
        .rotationEffect(.degrees(rolled ? 360 : 0))
        .animation(Animation.easeInOut(duration: 0.2))
      Button(action: {
        self.roll()
      }, label: {
        Text("Roll")
          .font(.system(size: 16))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .frame(height: 6)
          .padding()
          .background(Color.red)
          .cornerRadius(20)
      })
      .scaleEffect(press ? 0.9 : 1)
      .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { inProgress in
        withAnimation(.easeInOut(duration: 0.2), {
          self.press = inProgress
        })
      }, perform: {})
    }
    .navigationBarTitle("DiceView", displayMode: .inline)
  }
}

#Preview {
  DiceView()
}
