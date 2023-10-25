//
//  AppSelection.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import SwiftUI
import ComposableArchitecture
import FamilyControls


struct AppSelectionView: View {
    @Environment(\.modelContext) private var context
    
    let store: StoreOf<AppSelection>
    
    var body: some View {
        store.send(.viewLoaded)
        return WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                viewStore.send(.selectAppsButtonTapped)
            } label: {
                Text("Select Apps")
                    .bold()
                    .font(.title2)
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(.indigo, in: .capsule)
            .foregroundStyle(.white)
            .familyActivityPicker(
                isPresented: viewStore.$pickerIsPresented,
                selection: viewStore.$activitySelection
            )
        }
    }
    
}

//class ScreenTimeSelectAppsModel: ObservableObject {
//    let store = ManagedSettingsStore()
//    @Published var activitySelection = FamilyActivitySelection()
//    @Published var appCount = 0
//    
//
//    init() {
//        
//    }
//    
//    func shield(){
//        
//        // get the applications selected and shield them
//        appCount = activitySelection.applicationTokens.count
//        store.shield.applications = activitySelection.applicationTokens
//    }
//    
//    func unshield(){
//        // setting the shielded application to nil will stop shielding every application, updating shield application list would change wich app will be shielded depending on the selection
//        appCount = 0
//        store.shield.applications = nil
//        store.dateAndTime.requireAutomaticDateAndTime = false
//    }
//    
//    
//    func starmonitoring(){
//        
//        //monitors selcted app for time usage for 30 minutesas a threshold (you have 30 minutes of app usage for the selected app, after this the MyMonitorExtension callback is called )
//        
//        let schedule = DeviceActivitySchedule(
//            intervalStart: DateComponents(hour: 0, minute: 0, second: 0),
//            intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),
//            repeats: true
//        )
//        
//        
//        let timeLimitMinutes = 30
//        
//        let event =  DeviceActivityEvent(applications: activitySelection.applicationTokens,
//            threshold: DateComponents(minute: timeLimitMinutes)
//        )
//        let center = DeviceActivityCenter()
//        let eventName = DeviceActivityEvent.Name("MyApp.event")
//        
//       try? center.startMonitoring(DeviceActivityName("CountOpenTimes"), during: schedule, events: [eventName:event])
//        
//        
//    }
//}


#Preview {
    AppSelectionView(store: Store(initialState: AppSelection.State()){
        AppSelection()
    })
}
