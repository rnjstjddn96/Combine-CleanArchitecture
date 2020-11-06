//
//  ContentView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI
import Combine

struct ContentView: View {
    let container: DIContainer
    @State var toggle: Bool = false
    
    init(container: DIContainer) {
        self.container = container
    }
    
    var body: some View {
            VStack {
                Toggle("Goto ClassList", isOn: $toggle)
                    .padding()
                if !toggle {
                    TodoListView()
                        .inject(container)
                } else {
                    ClassListView()
                        .inject(container)
                }
            }
    }
}

