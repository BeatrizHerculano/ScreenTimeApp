//
//  ShieldActions.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 25/10/23.
//

import Foundation
import ManagedSettings


class MyShieldActionDelegate: ShieldActionDelegate {
    override func handle(action: ShieldAction, for application: ApplicationToken, completionHandler: @escaping (ShieldActionResponse) -> Void) {
        switch action {
            
        case .primaryButtonPressed:
            completionHandler(.close)
            
        case .secondaryButtonPressed:
            completionHandler(.defer)
            
        @unknown default:
            completionHandler(.none)
            
        }
        completionHandler(.none)
    }
}
