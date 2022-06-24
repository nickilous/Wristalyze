//
//  HealthkitManager.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/24/22.
//

import Foundation
import HealthKit

class HealthkitManager: ObservableObject {
    private var store: HKHealthStore
    
    //Optional initializer that is nil if HKHealthStore is unavailable
    init?() {
        if HKHealthStore.isHealthDataAvailable() {
            self.store = HKHealthStore()
        } else {
            return nil
        }
    }
    
}
