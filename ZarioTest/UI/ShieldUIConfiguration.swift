//
//  ShieldUIConfiguration.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import Foundation
import ManagedSettingsUI
import ManagedSettings
import ComposableArchitecture
import SwiftData


class ShieldDataUI: ShieldConfigurationDataSource {
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        
        if let token = application.token {
            let repo = SelectedApplicationRepository()
            print("shield appeared, number of shielded apps:\(repo.count())")
            if let registeredApp = repo.fetch(token: token){
                repo.incrementTimesOpenes(app: registeredApp)
            }
        }
       
        return .init(
            primaryButtonLabel: .init(text: "Close app", color: .white),
            primaryButtonBackgroundColor: .systemIndigo,
            secondaryButtonLabel: .init(text: "Open App", color: .systemIndigo)
        )
    }
}
