//
//  ApplicationsInteractor.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import SwiftData
import FamilyControls
import ManagedSettings

struct AppSelection: Reducer{
    let store =  ManagedStore()
    
    struct State: Equatable{
        @BindingState var pickerIsPresented: Bool = false
        @BindingState var activitySelection: FamilyActivitySelection = FamilyActivitySelection()
    }
    
    enum Action: BindableAction{
        case viewLoaded
        case selectAppsButtonTapped
        case removeShieldButtonTapped
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action{
            case .selectAppsButtonTapped:
                state.pickerIsPresented = true
                return .none
                
            case .removeShieldButtonTapped:
                self.removeShieldFromApps()
                return .none
                
            case .viewLoaded:
                self.requestAuthorization()
                return .none
                
            case .binding(\.$activitySelection):
                print(state.activitySelection.applications.count)
                self.shieldSelectedApps(state: state)
                return .none
                
            case .binding(_):
                return .none
            
            }
        }
    }
    
    func requestAuthorization(){
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            } catch {
                print(error)
            }
        }
    }
    
    func shieldSelectedApps(state: State){
        let apps = state.$activitySelection.wrappedValue.applications
        
        let repo = SelectedApplicationRepository()
        
        repo.removeAllData()
        
        for app in apps {
            if let token = app.token, let name = app.localizedDisplayName{
                repo.add(app: .init(aplication: token, name: name))
            }
            
        }
        
        print("there is \(repo.count()) registers")
        
        store.shield(apps: state.$activitySelection.wrappedValue.applicationTokens)
    }
    
    func removeShieldFromApps(){
        
        print("Removing all shields from apps")
       
        let repo = SelectedApplicationRepository()
        
        print("there is \(repo.count()) registers before delete")
        
        repo.removeAllData()
        store.removeShield()
        
        print("there is \(repo.count()) registers")
    }
}
