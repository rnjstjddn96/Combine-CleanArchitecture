//
//  TodoList.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/02.
//

import Foundation
import SwiftUI

typealias TodoList = [Todo]

struct Todo: Identifiable {
    var id: String
    var title: String
    var subTitle: String
    var content: String
    var importancy: Importancy
//    var author: User
    
    init(id: String, title: String, subTitle: String, content: String, _importancy: Importancy) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.content = content
        self.importancy = _importancy
    }
}

enum Importancy: String {
    case emergency
    case noNeedToHurry
    case notNeccessary
    
    var importancyValue: Int {
        switch self {
        case .emergency:
            return 3
        case .noNeedToHurry:
            return 2
        case .notNeccessary:
            return 1
        }
    }
    
    var importancyColor: Color {
        switch self {
        case .emergency:
            return .red
        case .noNeedToHurry:
            return .yellow
        case .notNeccessary:
            return .green
        }
    }
}

