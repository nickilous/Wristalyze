//
//  ServiceAthleteProtocol.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation


protocol ServiceAthleteProtocol {
    func readAthlete() async throws -> Athlete 
}
