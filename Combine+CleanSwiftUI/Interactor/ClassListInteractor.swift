//
//  ClassListInteractor.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import Foundation
import SwiftUI
import Combine

protocol ClassListInteractorProtocol {
    func fetchList(classList: Binding<ClassList>)
}

class ClassListInteractor: ClassListInteractorProtocol {
    
    let appState: AppState
    let classWebRepository: ClassWebRepositoryProtocol
    let bgQueue = DispatchQueue(label: "bq_parse_queue", qos: .default)
    var cancellable = Set<AnyCancellable>()
    
    init(appState: AppState, classWebRepository: ClassWebRepositoryProtocol) {
        self.appState = appState
        self.classWebRepository = classWebRepository
    }
    
    func fetchList(classList: Binding<ClassList>) {
            guard let url = URL(string: "http://150.109.84.234:10151/api/v1/classes") else { return }
            URLSession.shared
                .dataTaskPublisher(for: url)
                .subscribe(on: bgQueue)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: ClassList.self, decoder: JSONDecoder())
                .sink { completion in
                    if case .failure(let error) = completion {
                        print("error: \(error)")
                    }
                } receiveValue: { value in
                    print("value: \(value)")
                    self.appState.classList = value
                    classList.wrappedValue = self.appState.classList
                }
                .store(in: &cancellable)
    }
}

struct StubClassListInteractor: ClassListInteractorProtocol {
    func fetchList(classList: Binding<ClassList>) { }
}
