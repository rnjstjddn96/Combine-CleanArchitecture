//
//  ClassWebRepository.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/05.
//

import Foundation
import Combine
import SwiftUI

protocol ClassWebRepositoryProtocol {
    func getLists(classList: Binding<ClassList>)
}

class ClassWebRepository: ClassWebRepositoryProtocol {
    let bgQueue = DispatchQueue(label: "bq_parse_queue", qos: .default)
    var cancellable = Set<AnyCancellable>()
    
    func getLists(classList: Binding<ClassList>) {
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
                classList.wrappedValue = value
            }
            .store(in: &cancellable)
    }
    
}
