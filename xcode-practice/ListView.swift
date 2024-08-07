//
//  ListView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct ListView: View {
  var body: some View {
    List {
      Section(header: Text("9V Bolts")) {
        ForEach(1...4, id: \.self) { itemIndex in
          SmallCard(icon: "bolt.fill", title: "Bolt \(itemIndex)", content: "9V", bgColor: Color.yellow)
            .listRowSeparator(.hidden)
        }
      }
      Section(header: Text("4.5V Bolts")) {
        ForEach(1...4, id: \.self) { itemIndex in
          SmallCard(icon: "bolt.fill", title: "Bolt \(itemIndex)", content: "4.5V", bgColor: Color.init(hex: 0xffaa22))
            .listRowSeparator(.hidden)
        }
      }
    }
    .listStyle(PlainListStyle())
    .navigationBarTitle("ListView", displayMode: .large)
    .navigationBarItems(
      trailing:
        NavigationLink(destination:
          Text("Unimplemented")
        ) {
          Image(systemName: "cart.fill")
            .foregroundColor(.black)
        }
    )
  }
}

#Preview {
  ListView()
}
