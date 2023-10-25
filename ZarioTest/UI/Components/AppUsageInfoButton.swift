//
//  AppUsageInfoButoon.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 25/10/23.
//

import SwiftUI
import ComposableArchitecture

struct AppUsageInfoButton: View {
    
    var body: some View {
        NavigationLink{
            let store = StoreOf<AppUsageInfo>(initialState: AppUsageInfo.State()) {
                AppUsageInfo()
            }
            AppUsageList(store: store)
        } label:{
            Text("Show App Usage")
                .bold()
                .font(.title2)
        }
    }
}

#Preview {
    AppUsageInfoButton()
}
