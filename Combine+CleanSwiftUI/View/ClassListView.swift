//
//  ClassListView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import SwiftUI
import Combine

struct ClassListView: View {
    @Environment(\.injected) private var injected: DIContainer
    @State var classList: ClassList = []
    
    var body: some View {
        VStack {
            NavigationView {
                List(classList, id: \.id) { _class in
                        ClassListCell(_class: _class)
                            .frame(height: 100)
                            .padding()
                }
                .navigationBarTitle("ClassList")
            }
            .onAppear() {
                injected.interactors.classListInteractor.fetchList(classList: $classList)
            }
        }
    }
}

struct ClassListView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListView()
    }
}
