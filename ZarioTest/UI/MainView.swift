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

struct MainView: View {
   
    
    
    var body: some View {
        let store = Store(initialState: AppSelection.State()){
            AppSelection()
        }
        NavigationView{
            VStack{
                AppSelectionView(store: store)
                
                RemoveShieldView(store: store)
                
                AppUsageInfoButton()
            }
        }
        
        
    }
    
    
}

#Preview {
    MainView()
}




