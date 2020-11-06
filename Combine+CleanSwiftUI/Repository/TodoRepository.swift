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
        let todo1 = Todo(id: "0", title: "점심먹기", subTitle: "회사", content: "회사에서 점심먹기", _importancy: .notNeccessary)
        let todo2 = Todo(id: "1", title: "카드값 결제", subTitle: "신용카드", content: "카드값 결제해라 카드값 결제해라 카드값 결제해라 카드값 결제해라", _importancy: .emergency)
        let todo3 = Todo(id: "2", title: "아아아아", subTitle: "뭐하지", content: " Content Content Content Content Content ", _importancy: .noNeedToHurry)
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
