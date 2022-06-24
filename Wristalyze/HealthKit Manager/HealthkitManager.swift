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
    private var permissions: Set<HKObjectType> = [ HKCharacteristicType(.biologicalSex),
                                                   HKCharacteristicType(.dateOfBirth)]
    ///Optionally initialize HealthkitManager based on whether HKHealthStore is available or not
    /// - Returns: nil if HKHealthStore is not available
    init?() {
        if HKHealthStore.isHealthDataAvailable() {
            self.store = HKHealthStore()
        } else {
            return nil
        }
    }
    
    /// - Returns: Newly instantiated Athlete
    /// - Throws: Throws errors asscoiated with trying to access data related to creating an athlete
    func fetchAthlete() async throws -> Athlete {
        
        
        let sex = try store.biologicalSex().biologicalSex
        let dateOfBirth = try store.dateOfBirthComponents()
        
        
        //Queries for non characteristic data
        let heightQuery = HKStatisticsQueryDescriptor(predicate: .quantitySample(type: .init(.height)), options: .mostRecent)
        let bodyMassQuery = HKStatisticsQueryDescriptor(predicate: .quantitySample(type: .init(.bodyMass)), options: .mostRecent)
        
        //Execute Queries for non characteristic data
        let heightResult = try await heightQuery.result(for: store)
        guard let heightSample = heightResult?.mostRecentQuantity() else { throw HKError.init(.errorHealthDataUnavailable) }
        
        
        let bodyMassResult = try await bodyMassQuery.result(for: store)
        guard let bodyMassSample = bodyMassResult?.mostRecentQuantity() else { throw HKError.init(.errorHealthDataUnavailable) }
        
        
        
        return Athlete(dateOfBirth: dateOfBirth, sex: sex, bodyMass: bodyMassSample, height: heightSample)
    }
}
    
