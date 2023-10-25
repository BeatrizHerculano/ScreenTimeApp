//
//  Application.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 24/10/23.
//

import Foundation
import ManagedSettings
import SwiftData

@Model
class SelectedApplication {
    var aplicationToken: ApplicationToken
    var timesOpened: Int
    
    init(aplicationToken: ApplicationToken, timesOpened: Int = 0) {
        self.aplicationToken = aplicationToken
        self.timesOpened = timesOpened
    }
}
