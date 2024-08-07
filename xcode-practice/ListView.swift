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
      Section(header: Text("9V Batteries")) {
        ForEach(1...3, id: \.self) { itemIndex in
          SmallCard(icon: "bolt.fill", title: "Battery \(itemIndex)", content: "9V", bgColor: Color.yellow)
            .listRowSeparator(.hidden)
        }
        SmallCard(icon: "bolt.fill", title: "Battery 4 (Disabled)", content: "9V", bgColor: Color.gray)
          .listRowSeparator(.hidden)
      }
      Section(header: Text("1.5V Batteries")) {
        ForEach(1...3, id: \.self) { itemIndex in
          SmallCard(icon: "bolt.fill", title: "Battery \(2 * itemIndex - 1)", content: "1.5V", bgColor: Color.init(hex: 0xffaa22))
            .listRowSeparator(.hidden)
          SmallCard(icon: "bolt.fill", title: "Battery \(2 * itemIndex) (Disabled)", content: "1.5V", bgColor: Color.gray)
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
