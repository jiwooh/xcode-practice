//
//  PickerView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct PickerView: View {
  @State private var sel = 0
  
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
      Text("Selected value: \(sel)")
      Picker (
        selection: $sel,
        label: Text("Picker"),
        content: {
          Text("Apple").tag(0)
          Text("Banana").tag(1)
          Text("Candy").tag(2)
          Text("Donut").tag(3)
        }
      )
      Picker (
        selection: $sel,
        label: Text("Picker"),
        content: {
          Text("Apple").tag(0)
          Text("Banana").tag(1)
          Text("Candy").tag(2)
          Text("Donut").tag(3)
        }
      )
      .pickerStyle(SegmentedPickerStyle())
      .padding(.horizontal, 30)
    }
    .navigationBarTitle("PickerView", displayMode: .large)
  }
}

#Preview {
  PickerView()
}
