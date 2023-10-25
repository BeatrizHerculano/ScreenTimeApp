//
//  ContentView.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 23/10/23.
//

import SwiftUI
import FamilyControls
import DeviceActivity
import ManagedSettings
import ManagedSettingsUI
import ComposableArchitecture

struct ContentView: View {
   
    
    
    var body: some View {
        let store = Store(initialState: AppSelection.State()){
            AppSelection()
        }
        
        VStack{
            AppSelectionView(store: store)
            
            RemoveShieldView(store: store)
        }
        
    }
    
    
}

#Preview {
    ContentView()
}




class MyMonitorExtension: DeviceActivityMonitor {

    // callback to when the event threshold is met
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        
    }
    
    
}



class MyShieldActionDelegate: ShieldActionDelegate {
    override func handle(action: ShieldAction, for application: ApplicationToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        // callback to when a action on the shied ui happened
        // the action are interaction with the primary and secondary buttons
        // is is where i would open or close the shielded app
        switch action {
            
        case .primaryButtonPressed:
            completionHandler(.close)
        case .secondaryButtonPressed:
            completionHandler(.none)
        @unknown default:
            completionHandler(.defer)
        }
        // stop remove app from shielded list
        // store.shield.applications?.remove(application)
        // find what completion to use to open the shielded app, PROBABLY DEFER
        completionHandler(.none)
        
        
    }
}
