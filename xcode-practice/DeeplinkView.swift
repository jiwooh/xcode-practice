//
//  DeeplinkView.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import SwiftUI

struct item: Identifiable, Hashable {
  var id: Int
  var title: String
}
func prepItem() -> [item] {
  var list = [item]()
  
  for i in 1...20 {
    let new = item(id: i, title: "Item \(i)")
    list.append(new)
  }
  return list
}

struct DeeplinkView: View {
  @State var items = [item]()
  @State var activeID: Int?
  init() {
    _items = State(initialValue: prepItem())
  }
  
  var body: some View {
    VStack {
      VStack {
        Text("xcode-prac://(id)")
          .fontWeight(.bold)
          .font(.system(size: 16))
        
        List(items) { it in
          NavigationLink(value: it.id) {
            Text(it.title)
          }
        }
        .onOpenURL { url in
          if let id = url.selectItemID {
            activeID = id
          }
        }
      }
      .navigationDestination(for: Int.self) { id in
        if let selectedItem = items.first(where: { $0.id == id }) {
          Text(selectedItem.title)
        }
      }
    }
    .onChange(of: activeID) { id in
      guard let id = id else { return }
      if let item = items.first(where: { $0.id == id }) {
        DispatchQueue.main.async {
          activeID = id
        }
      }
    }
    .navigationBarTitle("DeeplinkView (WIP)", displayMode: .inline)
  }
}

#Preview {
  DeeplinkView()
}

extension URL {
  var isDeeplink: Bool {
    return scheme == "xcode-prac"
  }
  var selectItemID: Int? {
    guard isDeeplink,
      let id = Int(host ?? "")
    else {
      return nil
    }
    return id
  }
}
