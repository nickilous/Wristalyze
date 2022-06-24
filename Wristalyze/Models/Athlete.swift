//
//  Athlete.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/24/22.
//

import Foundation
import HealthKit

struct Athlete: Identifiable {
    var id: UUID = UUID()
    var dateOfBirth: DateComponents
    var sex: HKBiologicalSex
    var bodyMass: HKQuantity
    var height: HKQuantity
}
