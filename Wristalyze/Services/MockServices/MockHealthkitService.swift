//
//  MockHealthkitService.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation
import HealthKit


class MockHealthkitService: ServiceProtocol {
    var serviceType: ServiceType
    
    private var store: HKHealthStore = HKHealthStore()
    
    init(as type: ServiceType) {
        self.serviceType = type
    }
}


extension MockHealthkitService: ServiceAvailableProtocol {
    var available: Availability {
        if HKHealthStore.isHealthDataAvailable() {
            return .available
        } else {
            return .unavailable
        }
    }
}


extension MockHealthkitService: ServicePermissionProtocol {
    func requestPermission(store: StoreRequiresPermissionProtocol) async throws {
        try await store.requestPermission()
    }
}

extension MockHealthkitService: ServiceAthleteProtocol {
    func readAthlete() async throws -> Athlete {
        let dateOfBirth = try store.dateOfBirthComponents()
        let biologicalSex = try store.biologicalSex().biologicalSex
        
        return Athlete()
    }
}
