//
//  AppEnvironment.swift
//  Combine+CleanSwiftUI
//
//  Created by imf-mini-3 on 2020/11/03.
//

import Combine
import SwiftUI
struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = AppState()
        let dbRepository = configureDBRepository(appState: appState)
        let webRepository = configureWebRepository(appState: appState)
        let interactors = configureInteractors(appState: appState, DBrepositories: dbRepository, WebRepository: webRepository)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configureDBRepository(appState: AppState) -> DIContainer.DBRepository {
        let todoDBRepository = TodoRepository()
        return .init(todoRepository: todoDBRepository)
    }
    
    private static func configureWebRepository(appState: AppState) -> DIContainer.WebRepository {
        let classWebRepository = ClassWebRepository()
        return .init(classWebRepository: classWebRepository)
    }
    
    private static func configureInteractors(appState: AppState, DBrepositories: DIContainer.DBRepository, WebRepository: DIContainer.WebRepository)
    -> DIContainer.Interactors {
        let todoInteractor = ListInteractor(appState: appState, todoRepository: DBrepositories.todoRepository)
        let classInteractor = ClassListInteractor(appState: appState, classWebRepository: WebRepository.classWebRepository)
        
        return .init(listInteractor: todoInteractor, classListInteractor: classInteractor)
    }
}
