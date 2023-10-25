//
//  AppUsageInfo.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 25/10/23.
//

import Foundation
import ComposableArchitecture
import ManagedSettings

struct AppUsageInfo: Reducer{
    
    struct State: Equatable{
        var shildedApps: [SelectedApplication] = []
    }
    
    enum Action {
        case viewLoaded
        case shieldedAppsResponse([SelectedApplication])
        case itemDeleted(IndexSet)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action{
            case .viewLoaded:
                let apps = loadShildedApps(state: state)
                return .send(.shieldedAppsResponse(apps))
                
            case let .shieldedAppsResponse(apps):
                state.shildedApps = apps
                return .none
                
            case let .itemDeleted(offsets):
                let appsToDelete = offsets.map { state.shildedApps[$0] }
                state.shildedApps.remove(atOffsets: offsets)
                deleteShieldedApp(apps: appsToDelete)
                return .none
            }
        }
    }
    
    func loadShildedApps(state: State) -> [SelectedApplication] {
         SelectedApplicationRepository().fetchAll()
    }
    
    func deleteShieldedApp(apps: [SelectedApplication]) {
        for app in apps {
            guard let token = app.aplication else { return }
            SelectedApplicationRepository().remove(token: token )
        }
        
    }
}
