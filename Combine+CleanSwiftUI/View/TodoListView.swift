//
//  TodoListView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI

struct TodoListView: View {
    @Environment(\.injected) private var injected: DIContainer
    @State var todoList: TodoList = []
    @State var id: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoList, id: \.id) { todo in
                    ZStack {
                        ListCell(todo: todo)
                            .padding()
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(10)
                        NavigationLink(destination: TodoDetailView(selected: todo)) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .listRowBackground(Color.clear)
//                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                .onDelete(perform: deleteTodo)
            }.id(id)
            .background(Color.red)
            .navigationBarTitle("TodoList")
            .navigationBarItems(leading: sortBtn, trailing: addBtn)
        }
        .onAppear() {
            injected.interactors.listInteractor.loadLists(list: $todoList)
        }
    }
    
    var sortBtn: some View {
        Menu("SortBy") {
            Button("Title", action: { injected.interactors.listInteractor.sortByTitle(list: $todoList) })
            Button("Tag", action: { injected.interactors.listInteractor.sortByImportancy(list: $todoList) })
        }
    }
    
    var addBtn: some View {
        NavigationLink("Add", destination: TodoAddView(todoList: $todoList))
    }
    
    func deleteTodo(at offset: IndexSet) {
        for index in offset {
            injected.interactors.listInteractor.deleteList(todo: todoList[index], list: $todoList)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
