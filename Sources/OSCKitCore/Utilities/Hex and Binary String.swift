//
//  Hex and Binary String.swift
//  OSCKit • https://github.com/orchetect/OSCKit
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

import Foundation

// MARK: - Hex String

extension BinaryInteger {
    /// Returns an integer as a hex string.
    /// Prefix optional.
    func hexString(prefix: Bool = true) -> String {
        (prefix ? "0x" : "")
            + String(self, radix: 16, uppercase: true)
    }
    
    /// Returns an integer as a hex string padded to _n_ characters after the prefix.
    /// Prefix optional.
    func hexString(padTo: Int, prefix: Bool = true) -> String {
        let radixString = String(self, radix: 16, uppercase: true)
        return (prefix ? "0x" : "")
            + String(repeating: "0", count: max(0, padTo - radixString.count))
            + radixString
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns a collection of integers as a flat string of hex strings.
    /// Prefix optional.
    func hexString(
        prefixes: Bool = true,
        separator: String = " "
    ) -> String {
        map { $0.hexString(prefix: prefixes) }
            .joined(separator: separator)
    }
    
    /// Returns a collection of integers as a flat string of hex strings
    /// padded to _n_ characters after the prefix.
    /// Prefixes optional.
    func hexString(
        padEachTo: Int,
        prefixes: Bool = true,
        separator: String = " "
    ) -> String {
        map { $0.hexString(padTo: padEachTo, prefix: prefixes) }
            .joined(separator: separator)
    }
    
    /// Returns a concatenated string formatted as a hex string array literal.
    func hexStringArrayLiteral(padEachTo: Int = 2) -> String {
        "[" + hexString(padEachTo: padEachTo, prefixes: true, separator: ", ") + "]"
    }
}

// MARK: - Binary String

extension BinaryInteger {
    /// Returns an integer as a binary string.
    /// Prefix optional.
    func binaryString(prefix: Bool = true) -> String {
        (prefix ? "0b" : "")
            + String(self, radix: 2, uppercase: true)
    }
    
    /// Returns an integer as a binary string padded to _n_ characters after the prefix.
    /// Prefix optional.
    func binaryString(padTo: Int, prefix: Bool = true) -> String {
        let radixString = String(self, radix: 2, uppercase: true)
        return (prefix ? "0b" : "")
            + String(repeating: "0", count: max(0, padTo - radixString.count))
            + radixString
    }
}

extension Collection where Element: BinaryInteger {
    /// Returns a collection of integers as a flat string of binary strings.
    /// Prefix optional.
    func binaryString(
        prefixes: Bool = true,
        separator: String = " "
    ) -> String {
        map { $0.binaryString(prefix: prefixes) }
            .joined(separator: separator)
    }
    
    /// Returns a collection of integers as a flat string of binary strings
    /// padded to _n_ characters after the prefix.
    /// Prefixes optional.
    func binaryString(
        padEachTo: Int,
        prefixes: Bool = true,
        separator: String = " "
    ) -> String {
        map { $0.binaryString(padTo: padEachTo, prefix: prefixes) }
            .joined(separator: separator)
    }
}
