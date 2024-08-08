//
//  DiceState.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import SwiftUI

struct DiceState {
  var currentDice: Int {
    didSet {
      print("currentDice: \(currentDice)", #fileID, #function)
    }
  }
}
