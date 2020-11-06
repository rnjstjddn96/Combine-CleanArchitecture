//
//  ListInteractor.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import Foundation
import SwiftUI

protocol ListInteractorProtocol {
    func loadLists(list: Binding<TodoList>)
    func createList(newList: Todo, list: Binding<TodoList>)
    func deleteList(todo: Todo, list: Binding<TodoList>)
}

struct ListInteractor: ListInteractorProtocol {
    
    let appState: AppState
    let todoRepository: TodoRepositoryProtocol
    
    init(appState: AppState, todoRepository: TodoRepositoryProtocol) {
        self.appState = appState
        self.todoRepository = todoRepository
    }
    
    func loadLists(list: Binding<TodoList>) {
        let receivedData = todoRepository.getAllLists()
        appState.todoList = receivedData
        list.wrappedValue = appState.todoList
    }
    
    func createList(newList: Todo, list: Binding<TodoList>) {
        let receivedData = todoRepository.createList(newList: newList)
        appState.todoList.append(receivedData)
        list.wrappedValue = appState.todoList
    }
    
    func deleteList(todo: Todo, list: Binding<TodoList>) {
        todoRepository.removeList(item: todo)
        appState.todoList = appState.todoList.filter{ todo.id != $0.id }
//        appState.todoList = todoRepository.getAllLists()
        list.wrappedValue = appState.todoList
    }
}

struct StubListInteractor: ListInteractorProtocol {
    func createList(newList: Todo, list: Binding<TodoList>) { }
    func deleteList(todo: Todo, list: Binding<TodoList>) { }
    func loadLists(list: Binding<TodoList>) { }
}
