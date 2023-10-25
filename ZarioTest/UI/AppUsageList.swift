//
//  AppUsageList.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 25/10/23.
//

import SwiftUI
import ComposableArchitecture

struct AppUsageList: View {
    let store: StoreOf<AppUsageInfo>
    var body: some View {
        return WithViewStore(self.store, observe: { $0 }){ viewStore in
            if(viewStore.shildedApps.isEmpty){
                Text("No Shielded Apps")
            } else {
                List{
                    
                    ForEach(viewStore.shildedApps, id: \.self) { app in
                        HStack{
                            Text("\(app.name ?? "No App Name")")
                            Spacer()
                            Text("opened \(app.timesOpened) times")
                        }
                    }.onDelete(perform: delete)
                    
                }
            }
            
        }.onAppear(perform: {
            store.send(.viewLoaded)
        })
    }
    
    func delete(at offsets: IndexSet){
        store.send(.itemDeleted(offsets))
    }
}

#Preview {
    AppUsageList(store: Store(initialState: AppUsageInfo.State(), reducer: {
        AppUsageInfo()
    }))
}
