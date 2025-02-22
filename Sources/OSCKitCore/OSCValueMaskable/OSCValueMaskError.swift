//
//  OSCValueMaskError.swift
//  OSCKit • https://github.com/orchetect/OSCKit
//  © 2020-2025 Steffan Andrews • Licensed under MIT License
//

import Foundation

/// Error thrown by ``OSCValues`` `masked(...)` methods.
public enum OSCValueMaskError: LocalizedError {
    case invalidCount
    case mismatchedTypes
    
    public var errorDescription: String? {
        switch self {
        case .invalidCount:
            "Invalid argument count"
        case .mismatchedTypes:
            "Mismatched types"
        }
    }
}
