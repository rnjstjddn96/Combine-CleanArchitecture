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
    func sortByTitle(list: Binding<TodoList>)
    func sortByImportancy(list: Binding<TodoList>)
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
        list.wrappedValue.append(contentsOf: receivedData)
    }
    
    func createList(newList: Todo, list: Binding<TodoList>) {
        let receivedData = todoRepository.createList(newList: newList)
        list.wrappedValue.append(receivedData)
    }
    
    func deleteList(todo: Todo, list: Binding<TodoList>) {
        todoRepository.removeList(item: todo)
        list.wrappedValue = list.wrappedValue.filter{ todo.id != $0.id }
    }
    
    func sortByTitle(list: Binding<TodoList>) {
        list.wrappedValue = list.wrappedValue.sorted(by: { (first, second) -> Bool in
            first.title < second.title
        })
    }
    
    func sortByImportancy(list: Binding<TodoList>) {
        list.wrappedValue = list.wrappedValue.sorted(by: { (first, second) -> Bool in
            first.importancy.importancyValue > second.importancy.importancyValue
        })
    }
}

struct StubListInteractor: ListInteractorProtocol {
    func sortByTitle(list: Binding<TodoList>) { }
    func createList(newList: Todo, list: Binding<TodoList>) { }
    func deleteList(todo: Todo, list: Binding<TodoList>) { }
    func loadLists(list: Binding<TodoList>) { }
    func sortByImportancy(list: Binding<TodoList>) { }
}
