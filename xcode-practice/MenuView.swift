//
//  MenuView.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import SwiftUI

struct MenuView: View {
  @State private var showAlert: Bool = false
  @State private var buttonName: String = ""
  enum Selection: String, CaseIterable {
    case icons = "Icons"
    case list = "List"
    var id: String { self.rawValue }
    var iconName: String {
        switch self {
        case .icons:
            return "square.grid.2x2"
        case .list:
            return "list.bullet"
        }
    }
  }
  @State private var sel: Selection = .icons
  
  struct MyButton: View {
    let title: String
    let icon: String
    @Binding var showAlert: Bool
    @Binding var buttonName: String
    
    var body: some View {
      Button(action: {
        showAlert = true
        buttonName = title
      }, label: {
        Label("\(title)", systemImage: icon)
      })
    }
  }
  
  var body: some View {
    VStack {
      VStack {
        Text("Select items from the menu!")
          .padding()
          .font(.system(size: 30))
          .fontWeight(.bold)
        Text("Current selection: \(sel.rawValue)")
      }
        .toolbar(content: {
          ToolbarItem(placement: .primaryAction, content: {
            Menu(content: {
              Section {
                MyButton(title: "Select", icon: "checkmark.circle", showAlert: $showAlert, buttonName: $buttonName)
                MyButton(title: "New Folder", icon: "folder.badge.plus", showAlert: $showAlert, buttonName: $buttonName)
                MyButton(title: "Scan Documents", icon: "doc.viewfinder", showAlert: $showAlert, buttonName: $buttonName)
                MyButton(title: "Connect to Server", icon: "rectangle.connected.to.line.below", showAlert: $showAlert, buttonName: $buttonName)
              }
              Picker(selection: $sel, label: Text("Select view")) {
                ForEach(Selection.allCases, id: \.self) { selection in
//                  Text(selection.rawValue).tag(selection)
                  Label(selection.rawValue, systemImage: selection.iconName).tag(selection)
                }
              }
              Section {
                MyButton(title: "Print", icon: "printer", showAlert: $showAlert, buttonName: $buttonName)
                MyButton(title: "Save", icon: "square.and.arrow.down", showAlert: $showAlert, buttonName: $buttonName)
                MyButton(title: "Share", icon: "square.and.arrow.up", showAlert: $showAlert, buttonName: $buttonName)
              }
              Text("Secret message")
            }, label: {
              Label("Menu", systemImage: "ellipsis.circle")
            })
          })
        })
        .alert(isPresented: $showAlert, content: {
          Alert(
            title: Text("\(buttonName)"),
            message: Text("This action is currently unavailable."),
            dismissButton: .default(Text("Close"))
          )
        })
    }
    .navigationBarTitle("MenuView")
  }
}

#Preview {
  MenuView()
}
