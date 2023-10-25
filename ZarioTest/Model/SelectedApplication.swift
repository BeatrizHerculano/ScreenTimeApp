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
    var aplication: ApplicationToken?
    var name: String?
    var timesOpened: Int
    
    init(aplication: ApplicationToken?, name: String?, timesOpened: Int = 0) {
        self.aplication = aplication
        self.name = name
        self.timesOpened = timesOpened
    }
}
