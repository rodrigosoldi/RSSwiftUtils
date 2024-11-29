//
//  RSAsync.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 29/11/24.
//

import Foundation

public func timeoutAsyncTask<T, E: Error>(timeout: Int, error: E, _ operation: @escaping () async throws -> T) async throws -> T {
    let mainTask = Task {
        let taskResult: T = try await operation()
        try Task.checkCancellation()
        return taskResult
    }
        
    let timeoutTask = Task {
        try await Task.sleep(nanoseconds: UInt64(timeout) * NSEC_PER_SEC)
        mainTask.cancel()
        throw error
    }
        
    let result = try await mainTask.value
    timeoutTask.cancel()
    return result
}

