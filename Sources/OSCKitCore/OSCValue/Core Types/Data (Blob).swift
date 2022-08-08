//
//  Data (Blob).swift
//  OSCKit • https://github.com/orchetect/OSCKit
//

import Foundation
@_implementationOnly import OTCore

extension Data: OSCValue {
    public static let oscCoreType: OSCValueMask.Token = .blob
}

extension Data: OSCValueCodable { }

extension Data: OSCValueEncodable {
    static let oscTag: Character = "b"
    public static let oscTagIdentity: OSCValueTagIdentity = .atomic(oscTag)
    
    public typealias OSCValueEncodingBlock = OSCValueAtomicEncoder<OSCEncoded>
    public static let oscEncoding = OSCValueEncodingBlock { value in
        let lengthData = value.count.int32.toData(.bigEndian)
        let blobData = OSCMessageEncoder.fourNullBytePadded(value)
        
        return (
            tag: oscTag,
            data: lengthData + blobData
        )
    }
}

extension Data: OSCValueDecodable {
    public typealias OSCValueDecodingBlock = OSCValueAtomicDecoder<OSCDecoded>
    public static let oscDecoding = OSCValueDecodingBlock { decoder in
        try decoder.readBlob()
    }
}
