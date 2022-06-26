//
//  StoreRequiresPermissions.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation




protocol StoreRequiresPermissionProtocol {
    func requestPermission() async throws
}
