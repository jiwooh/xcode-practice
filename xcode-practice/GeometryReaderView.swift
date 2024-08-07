//
//  GeometryReaderView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

enum Index {
  case zero, one, two, three, four
}

struct GeometryReaderView: View {
  @State var index: Index = .zero
  
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 0) {
        Button(action: {
          self.index = .one
        }) {
          Text("1")
            .font(.largeTitle)
            .fontWeight(.black)
            .frame(width: 100, height: geo.size.height/4)
            .padding(.horizontal, self.index == .one ? 60 : 0)
            .foregroundColor(Color.white)
            .background(Color.init(hex: 0x603295))
        }
        .buttonStyle(PlainButtonStyle())
        
        Button(action: {
          self.index = .two
        }) {
          Text("2")
            .font(.largeTitle)
            .fontWeight(.black)
            .frame(width: 100, height: geo.size.height/4)
            .padding(.horizontal, self.index == .two ? 60 : 0)
            .foregroundColor(Color.white)
            .background(Color.init(hex: 0xcc5d0c))
        }
        .buttonStyle(PlainButtonStyle())
        
        Button(action: {
          self.index = .three
        }) {
          Text("3")
            .font(.largeTitle)
            .fontWeight(.black)
            .frame(width: 100, height: geo.size.height/4)
            .padding(.horizontal, self.index == .three ? 60 : 0)
            .foregroundColor(Color.white)
            .background(Color.init(hex: 0x4d5613))
        }
        .buttonStyle(PlainButtonStyle())
        
        Button(action: {
          self.index = .four
        }) {
          Text("4")
            .font(.largeTitle)
            .fontWeight(.black)
            .frame(width: 100, height: geo.size.height/4)
            .padding(.horizontal, self.index == .four ? 60 : 0)
            .foregroundColor(Color.white)
            .background(Color.init(hex: 0xf73663))
        }
      }
      .position(CGPoint(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY))
      .background(Color.black)
    }
    .edgesIgnoringSafeArea(.all)
    .navigationBarTitle("GeometryReaderView", displayMode: .large)
    .navigationBarHidden(true)
  }
}

#Preview {
  GeometryReaderView()
}
