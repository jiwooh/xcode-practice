//
//  TextFieldView.swift
//  xcode-practice
//
//  Created by minn on 8/7/24.
//

import SwiftUI

struct TextFieldView: View {
  @State private var uname: String = ""
  @State private var pwd: String = ""
  @State var alert: Bool = false
  
  var body: some View {
    VStack(spacing: 10) {
      Text("Sample Login Page")
        .font(.system(size: 24))
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      Divider().frame(height: 10).opacity(0)
      HStack {
        TextField("Username", text: $uname)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .autocapitalization(.none)
          .disableAutocorrection(true)
        Button(action: {
          self.uname = ""
        }) {
          if (self.uname.count > 0 ) {
            Image(systemName: "multiply.circle")
              .foregroundColor(.secondary)
          }
        }
      }
      HStack {
      SecureField("Password", text: $pwd)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
        .disableAutocorrection(true)
        Button(action: {
          self.pwd = ""
        }) {
          if (self.pwd.count > 0 ) {
            Image(systemName: "multiply.circle")
              .foregroundColor(.secondary)
          }
        }
      }
      Button(action: {
        self.alert = true
      }) {
        Text("Login")
          .font(.system(size: 14))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .frame(height: 5)
          .padding()
          .background(.tint)
          .cornerRadius(20)
      }
      .alert(isPresented: $alert) {
        Alert(
          title: Text("Sample message!"),
          message: Text(self.uname == "" && self.pwd == "" ? "" : "\(uname): \(pwd)")
        )
      }
    }
    .padding(.horizontal, 50)
    .navigationBarTitle("TextFieldView", displayMode: .large)
  }
}

#Preview {
  TextFieldView()
}
