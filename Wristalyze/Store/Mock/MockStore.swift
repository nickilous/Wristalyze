//
//  MockStore.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/25/22.
//

import Foundation


class MockStore: StoreRequiresPermissionProtocol {
    func requestPermission() async throws {
        Task {
            try await Task.sleep(nanoseconds: 150_000_000)
        }
    }
}
