//
//  AppSelection.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import SwiftUI
import ComposableArchitecture

struct RemoveShieldView: View {
    @Environment(\.modelContext) private var context
    
    let store: StoreOf<AppSelection>
    
    var body: some View {
        return WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button {
                viewStore.send(.removeShieldButtonTapped)
            } label: {
                Text("Remove Shield")
                    .bold()
                    .font(.title2)
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(.indigo, in: .capsule)
            .foregroundStyle(.white)
        }
    }
    
}

#Preview {
    AppSelectionView(store: Store(initialState: AppSelection.State()){
        AppSelection()
    })
}
