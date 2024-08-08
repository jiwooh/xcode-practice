//
//  DiceReducer.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func DiceReducer(state: inout DiceState, action: DiceAction) {
  switch action {
  case .roll:
    state.currentDice = Int.random(in: 1...6)
  }
}
