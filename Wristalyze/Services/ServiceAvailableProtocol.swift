//
//  ServiceAvailableProtocol.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation

enum Availability {
    case available
    case unavailable
    case unchcked
}

protocol ServiceAvailableProtocol: ServiceProtocol {
    var available: Availability { get }
}
