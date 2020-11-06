//
//  ListCell.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import SwiftUI

struct ListCell: View {
    let todo: Todo
    
    var body: some View {
        VStack {
            HStack {
                Text(todo.title)
                    .font(.title)
                    .padding([.leading])
                Spacer()
            }
            Divider()
            HStack {
                Text(todo.subTitle)
                    .font(.subheadline)
                    .padding([.leading])
                Spacer()
                Circle()
                    .foregroundColor(todo.importancy.importancyColor)
                    .frame(width: 10, height: 10)
                    .padding([.top, .trailing])
            }
        }
    }
}

struct Blurview: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Blurview>) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Blurview>) {
    }
}

//struct ListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCell(todo: Todo(id: "0", title: "할일", subTitle: "세부할일", content: "할일이 많쥬", _importancy: .emergency))
//    }
//}
