//
//  BigCard.swift
//  xcode-practice
//
//  Created by minn on 8/6/24.
//

import SwiftUI

struct BigCard: View {
  @State var alert: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Rectangle().frame(height: 0)
      Text("Title")
        .font(.system(size: 20))
        .fontWeight(.black)
        .foregroundColor(.white)
      Text("content")
        .font(.system(size: 14))
        .foregroundColor(.secondary)
      Spacer().frame(height: 15)
      
      HStack {
        Image("1")
          .resizable()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
          .overlay(
            Circle()
              .stroke(lineWidth: 3)
              .foregroundColor(Color.white)
          )
        Image("2")
          .resizable()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
          .overlay(
            Circle()
              .stroke(lineWidth: 3)
              .foregroundColor(Color.white)
          )
        Image("3")
          .resizable()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
          .overlay(
            Circle()
              .stroke(lineWidth: 3)
              .foregroundColor(Color.white)
          )
        Spacer()
        Button(action: {
          print("Click!")
          self.alert = true
        }, label: {
          Text("Button")
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 100)
            .background(.black)
            .cornerRadius(20)
        })
      }.alert(isPresented: $alert) {
        Alert(title: Text("Alert!"))
      }
    }
    .padding(20)
    .background(Color.red)
    .cornerRadius(20)
  }
}

#Preview {
  BigCard()
}
