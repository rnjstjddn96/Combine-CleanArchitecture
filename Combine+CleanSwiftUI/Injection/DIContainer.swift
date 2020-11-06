//
//  Injection.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/03.
//

import Foundation
import Combine
import SwiftUI

struct DIContainer: EnvironmentKey {
    
    let appState: AppState
    let interactors: Interactors
    
    init(appState: AppState, interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(appState: AppState() ,interactors: .stub)
}

extension DIContainer {
    struct Interactors {
        let listInteractor: ListInteractorProtocol
        let classListInteractor: ClassListInteractorProtocol
        
        init(listInteractor: ListInteractorProtocol, classListInteractor: ClassListInteractorProtocol) {
            self.listInteractor = listInteractor
            self.classListInteractor = classListInteractor
        }
        
        static var stub: Self {
            .init(listInteractor: StubListInteractor(), classListInteractor: StubClassListInteractor())
        }
    }
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

extension View {
    func inject(_ appState: AppState, _ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(appState: appState, interactors: interactors)
        return inject(container)
    }
    
    func inject(_ container: DIContainer) -> some View {
        return self.environment(\.injected, container)
    }
}

extension DIContainer {
    struct DBRepository {
        let todoRepository: TodoRepositoryProtocol
    }
    
    struct WebRepository {
        let classWebRepository: ClassWebRepositoryProtocol
    }

}
