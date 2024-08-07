//
//  SmallCard.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct SmallCard: View {
  var icon: String
  var title: String
  var content: String
  var bgColor: Color
  
  var body: some View {
    HStack(spacing: 15) {
      Image(systemName: icon)
        .font(.system(size: 30))
        .foregroundColor(Color.white)
      
      VStack(alignment: .leading, spacing: 0) {
        Divider().opacity(0)
        Text(title)
          .font(.system(size: 20))
          .fontWeight(.black)
          .foregroundColor(Color.white)
        Text(content)
          .font(.system(size: 14))
          .foregroundColor(.secondary)
      }
    }
    .padding(20)
    .background(bgColor)
    .cornerRadius(20)
  }
}

#Preview {
  SmallCard(icon: "flag.fill", title: "Title", content: "Content", bgColor: Color.green)
}
