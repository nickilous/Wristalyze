//
//  ServicePermissionProtocol.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation

protocol ServicePermissionProtocol: ServiceProtocol {
    func requestPermission(store: any StoreRequiresPermissionProtocol) async throws
}
