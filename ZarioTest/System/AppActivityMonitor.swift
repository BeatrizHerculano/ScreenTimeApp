//
//  AppActivityMonitor.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 25/10/23.
//

import Foundation
import DeviceActivity

class MyMonitorExtension: DeviceActivityMonitor {
    // callback to when the event threshold is met
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        
    }
}
