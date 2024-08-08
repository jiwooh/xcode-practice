//
//  PickerView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct PickerView: View {
  enum things: String, CaseIterable {
    case Apple = "Apple"
    case Bookmark = "Bookmark"
    case Carrot = "Carrot"
    case Door = "Door"
  }
  @State private var sel: things = things.Apple
  
  func getImage(index: things) -> String {
    switch index {
    case .Apple:
      return "apple.logo"
    case .Bookmark:
      return "bookmark.fill"
    case .Carrot:
      return "carrot.fill"
    case .Door:
      return "door.left.hand.closed"
    case _: return ""
    }
  }
  
  var body: some View {
    VStack(alignment: .center) {
      Image(systemName: getImage(index: sel))
        .frame(height: 50)
        .font(.system(size: 40))
        .foregroundColor(Color.init(hex: 0x5fcc5f))
        .padding(.bottom, 10)
      
      Text("Selected index: \(sel.rawValue)")
        .font(.system(size: 12))
      Picker (
        selection: $sel,
        label: Text("Picker"),
        content: {
          ForEach(things.allCases, id: \.self) { item in
              Text(item.rawValue).tag(item)
          }
        }
      )
      .accentColor(Color.init(hex: 0x5fcc5f))
      Picker (
        selection: $sel,
        label: Text("Picker"),
        content: {
          ForEach(things.allCases, id: \.self) { item in
              Text(item.rawValue).tag(item)
          }
        }
      )
      .pickerStyle(SegmentedPickerStyle())
      .padding(.horizontal, 30)
      Divider().frame(height: 10).opacity(0)
      
      ScrollView {
        ForEach(1...8, id: \.self) { itemIndex in
          SmallCard(
            icon: getImage(index: sel),
            title: "\(sel.rawValue) \(Character(UnicodeScalar("A".unicodeScalars.first!.value + UInt32(itemIndex) - 1)!))",
            content: "item",
            bgColor: Color.init(hex: 0x5fcc5f)
          )
          .listRowSeparator(.hidden)
        }
        .padding(.horizontal, 30)
      }
    }
    .navigationBarTitle("PickerView", displayMode: .large)
  }
}

#Preview {
  PickerView()
}
