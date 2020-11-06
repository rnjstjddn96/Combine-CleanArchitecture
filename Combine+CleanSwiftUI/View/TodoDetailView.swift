//
//  TodoDetailView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI

struct TodoDetailView: View {
    let selected: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(selected.title)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }.padding(.leading)
            HStack {
                Text(selected.subTitle)
                    .font(.footnote)
                Spacer()
            }.padding([.leading])
            Divider()
            Text(selected.content)
            .padding()
            Spacer()
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(selected: Todo(id: "123124", title: "할일1", subTitle: "할일1Sub", content: "lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum lorem porum", _importancy: .emergency))
    }
}
