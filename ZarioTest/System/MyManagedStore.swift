//
//  MyManagedStore.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import Foundation
import ManagedSettings

class ManagedStore {
    
    let store = ManagedSettingsStore()
    
    func shield(apps: Set<ApplicationToken>){
        store.shield.applications = apps
    }
    
    func removeShield(){
        store.shield.applications = nil
    }
    
    func removeShieldFromApp(token: ApplicationToken){
        store.shield.applications = store.shield.applications?.filter({ appToken in
            appToken != token
        })
    }
}

