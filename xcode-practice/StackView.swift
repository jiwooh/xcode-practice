//
//  StackView.swift
//  xcode-practice
//
//  Created by minn on 8/5/24.
//

import SwiftUI

struct StackView: View {
  @State private var isActivated: Bool = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Divider().opacity(0)
      Rectangle()
        .frame(width: 50, height: 50)
        .foregroundColor(.blue)
      Rectangle()
        .frame(height: 50)
        .foregroundColor(.yellow)
      Circle()
        .frame(height: 50)
        .foregroundColor(.blue)
    }
    
    HStack(alignment: .center) {
      ZStack {
        Image(systemName: "staroflife.fill")
          .font(.system(size: 120))
        Image(systemName: "staroflife.fill")
          .foregroundColor(.white)
          .font(.system(size: 80))
        Image(systemName: "staroflife.fill")
          .font(.system(size: 40))
      }
      Image(systemName: "equal.circle")
        .font(.system(size: 40))
      ZStack {
        Image(systemName: "staroflife.fill")
          .font(.system(size: 40))
          .zIndex(2)
        Image(systemName: "staroflife.fill")
          .foregroundColor(.white)
          .font(.system(size: 80))
          .zIndex(1)
        Image(systemName: "staroflife.fill")
          .font(.system(size: 120))
          .zIndex(0)
      }
    }
    
    VStack(alignment: .trailing, spacing: 20) {
      Divider().opacity(0)
      Circle()
        .frame(height: 50)
        .foregroundColor(.red)
      Rectangle()
        .frame(height: 50)
        .foregroundColor(.green)
      Rectangle()
        .frame(width: 50, height: 50)
        .foregroundColor(.red)
    }
  }
}

#Preview {
  StackView()
}
