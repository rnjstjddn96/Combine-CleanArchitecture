//
//  TodoRepository.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import Foundation

protocol TodoRepositoryProtocol {
    func getAllLists() -> TodoList
    func createList(newList: Todo) -> Todo
    func removeList(item: Todo)
//    func updateList(_ todo: Todo) -> Todo
}

class TodoRepository: TodoRepositoryProtocol {
    
    func getAllLists() -> TodoList {
        var todoList: TodoList = []
        let todo1 = Todo(id: "0", title: "할일1", subTitle: "할일Sub1", content: "할일1 content", _importancy: .emergency)
        let todo2 = Todo(id: "1", title: "할일2", subTitle: "할일Sub2", content: "할일2 content", _importancy: .notNeccessary)
        let todo3 = Todo(id: "2", title: "할일3", subTitle: "할일Sub3", content: "할일3 content", _importancy: .noNeedToHurry)
        todoList.append(contentsOf: [todo1, todo2, todo3])
        return todoList
    }
    
    func createList(newList: Todo) -> Todo {
        return newList
    }
    
    func removeList(item: Todo) {
        //API로 todo 삭제
    }
    
//    func updateList(_ todo: Todo) -> Todo {
//
//    }
    
    
}
