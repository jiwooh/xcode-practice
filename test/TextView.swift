//
//  TextView.swift
//  test
//
//  Created by minn on 8/4/24.
//

import SwiftUI

struct TextView: View {
  @Binding var isActivated: Bool
  init(isActivated: Binding<Bool> = .constant(true)) {
    self._isActivated = isActivated
  }
  
  var body: some View {
    VStack {
      Text("New Window!")
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .font(.system(size: 30))
        .padding(10)
      Text("isActivated: \(String(isActivated))")
        .foregroundColor(self.isActivated ? Color.blue : Color.gray)
    }
    .containerRelativeFrame([.horizontal, .vertical])
    .background(Color.yellow)
    //.edgesIgnoringSafeArea(.all)
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    TextView()
  }
}
