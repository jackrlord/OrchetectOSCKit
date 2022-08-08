//
//  Character.swift
//  OSCKit • https://github.com/orchetect/OSCKit
//

import Foundation
@_implementationOnly import OTCore
@_implementationOnly import SwiftASCII

// MARK: - OSC Encoding

extension Character: OSCValue {
    public static let oscCoreType: OSCValueMask.Token = .character
}

extension Character: OSCValueCodable { }

extension Character: OSCValueEncodable {
    static let oscTag: Character = "c"
    public static let oscTagIdentity: OSCValueTagIdentity = .atomic(oscTag)
    
    public typealias OSCValueEncodingBlock = OSCValueAtomicEncoder<OSCEncoded>
    public static let oscEncoding = OSCValueEncodingBlock { value in
        (
            tag: oscTag,
            data: ASCIICharacter(value)
                .asciiValue
                .int32
                .toData(.bigEndian)
        )
    }
}
extension Character: OSCValueDecodable {
    public typealias OSCValueDecodingBlock = OSCValueAtomicDecoder<OSCDecoded>
    public static let oscDecoding = OSCValueDecodingBlock { decoder in
        let asciiCharNum = try decoder.readInt32().int
        guard let asciiChar = ASCIICharacter(asciiCharNum) else {
            throw OSCDecodeError.malformed(
                "Character value couldn't be read. Could not form a Unicode scalar from the value."
            )
        }
        return asciiChar.characterValue
    }
}
