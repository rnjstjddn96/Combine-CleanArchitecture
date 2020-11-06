//
//  TodoAddView.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI

struct TodoAddView: View {
    @Environment(\.presentationMode) var presentaionMode
    @Environment(\.injected) private var injected: DIContainer
    
    @Binding var todoList: TodoList
    @State var title: String = ""
    @State var subTitle: String = ""
    @State var content: String = ""
    @State var importancy: Importancy = .emergency
    @State var importancyList: [Importancy] = [.emergency, .noNeedToHurry, .notNeccessary]
    @State var needAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                TextField("Title", text: $title).padding()
                TextField("SubTitle", text: $subTitle).padding()
                TextField("Content", text: $content).padding()
            }
            Picker(selection: $importancy, label: Text("Picker")) {
                ForEach(importancyList, id:\.self) {
                    Circle()
                        .foregroundColor($0.importancyColor)
                        .frame(width: 30, height: 30)
                }
            }
            .labelsHidden()
            .frame(width: SIZE.width, height: SIZE.height/7)
            Spacer()
            Button(action: {
                let contents = [title, subTitle, content]
                let isAddable = contents.compactMap { return !$0.isEmpty }
                guard !isAddable.contains(false) else { self.needAlert.toggle(); return }
                injected.interactors.listInteractor
                .createList(newList: Todo(id: randomString(len: 3),
                                         title: title,
                                         subTitle: subTitle,
                                         content: content,
                                         _importancy: importancy),
                                         list: $todoList)
                todoList = injected.appState.todoList
                presentaionMode.wrappedValue.dismiss()
            }) {
                Text("Add")
            }
        }
    }
    func randomString(len:Int) -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let c = Array(charSet)
        var s:String = ""
        for _ in (1...10) {
            s.append(c[Int(arc4random()) % c.count])
        }
        return s
    }
}


//struct TodoAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoAddView()
//    }
//}
