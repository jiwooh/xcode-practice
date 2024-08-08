//
//  DiceStore.swift
//  xcode-practice
//
//  Created by minn on 2024.08.08.
//

import Foundation

typealias DiceStore = Store<DiceState, DiceAction>

final class Store<State, Action>: ObservableObject {
  @Published private(set) var state: State
  
  private let reducer: Reducer<State, Action>
  
  init(state: State, reducer: @escaping Reducer<State, Action>) {
    self.state = state
    self.reducer = reducer
  }
  
  func dispatch(action: Action) {
    reducer(&self.state, action)
  }
}
