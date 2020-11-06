//
//  ListState.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var todoList: TodoList = []
    @Published var classList: ClassList = [] {
        didSet {
            print("brainew131: \(classList)")
        }
    }
}
