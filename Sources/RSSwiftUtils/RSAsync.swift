//
//  RSAsync.swift
//  RSSwiftUtils
//
//  Created by Rodrigo Soldi on 29/11/24.
//

import Foundation

/// Executes an asynchronous task with a specified timeout. If the task does not complete
/// within the given timeout, a fallback operation is executed.
/// - Parameters:
///   - timeout: The maximum time in seconds to wait for the operation to complete.
///   - operation: The asynchronous operation to execute.
///   - fallback: The asynchronous fallback operation to execute if the timeout is reached.
/// - Returns: The result of the operation if it completes in time, otherwise the result of the fallback.
/// - Throws: An error if the operation or fallback throws an error.
public func timeoutAsyncTask<T>(timeout: Int, _ operation: @escaping () async throws -> T, fallback: @escaping () async throws -> T) async throws -> T {
    let mainTask = Task {
        do {
            let taskResult: T = try await operation()
            try Task.checkCancellation()
            return taskResult
        } catch is CancellationError {
            throw CancellationError()
        }
    }
        
    let timeoutTask = Task {
        try await Task.sleep(nanoseconds: UInt64(timeout) * NSEC_PER_SEC)
        mainTask.cancel()
        return try await fallback()
    }
        
    do {
        let result = try await mainTask.value
        timeoutTask.cancel()
        return result
    } catch is CancellationError {
        return try await timeoutTask.value
    }
}
