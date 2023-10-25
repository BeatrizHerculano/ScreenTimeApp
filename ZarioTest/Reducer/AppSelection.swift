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

class AppSelection: Reducer{
    private var context: ModelContext?
    let store =  ManagedStore()
    
    struct State: Equatable{
        @BindingState var pickerIsPresented: Bool = false
        @BindingState var activitySelection: FamilyActivitySelection = FamilyActivitySelection()
    }
    
    enum Action: BindableAction{
        case viewLoaded
        case selectAppsButtonTapped(ModelContext)
        case removeShieldButtonTapped
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action{
            case let .selectAppsButtonTapped(context):
                state.pickerIsPresented = true
                self.context = context
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
        let tokens = state.$activitySelection.wrappedValue.applicationTokens
        guard let context = self.context else { return }
        
        let repo = SelectedApplicationRepository(context: context)
        
        repo.removeAllData()
        
        for token in tokens {
            repo.add(app: .init(aplicationToken: token))
        }
        
        print("there is \(repo.count()) registers")
        
        
//        store.shield(apps: tokens)
    }
    
    func removeShieldFromApps(){
        
        print("Removing all shields from apps")
        
//        guard let context = self.context else { return }
        guard let contextTeste = try? ModelContext.init(ModelContainer(for: SelectedApplication.self)) else { return }
        let repo = SelectedApplicationRepository(context: contextTeste)
        
        print("there is \(repo.count()) registers before delete")
        
        repo.removeAllData()
        
        store.removeShield()
        
        print("there is \(repo.count()) registers")
    }
}
