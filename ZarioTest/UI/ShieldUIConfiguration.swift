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
        
        print("app \(application) was open")
        
        // reducer for this
//        if let context = try? ModelContext.init(ModelContainer(for: SelectedApplication.self)), let token = application.token {
//            let repo = SelectedApplicationRepository(context: context)
//            print("shield appeared, number of shielded apps:\(repo.count())")
//            var registeredApp = repo.fetch(token: token)
//            registeredApp?.timesOpened += 1
//            do{
//                try context.save()
//            } catch {
//                print(error)
//            }
//            
//        }
        // count how many times the app was open
       
        
        
        return .init(backgroundColor: .red)
    }
}
