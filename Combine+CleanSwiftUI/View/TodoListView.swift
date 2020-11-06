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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoList, id: \.id) { todo in
                    NavigationLink(destination: TodoDetailView(selected: todo)) {
                        ListCell(todo: todo)
                            .padding()
                            .background(Blurview())
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .onDelete(perform: deleteTodo)
                .onMove (perform: moveTodo)
            }
            .padding(.top)
            .navigationBarTitle("TodoList")
            .navigationBarItems(trailing: addBtn)
            
        }
        .onAppear() {
            //TODO: appstate의 todoList를 로컬State 변수에 Binding
            //TODO: Redux + Store 개념 공부
            injected.interactors.listInteractor.loadLists(list: $todoList)
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
    
    func moveTodo(source: IndexSet, destination: Int) {
//        injected.interactors.listInteractor.moveList
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
