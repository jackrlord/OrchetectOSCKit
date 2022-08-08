//
//  Mask Token Tests.swift
//  OSCKit • https://github.com/orchetect/OSCKit
//

#if shouldTestCurrentPlatform

import XCTest
import OSCKitCore
import OTCore
import SwiftASCII

final class OSCMessage_Value_Mask_Token_Tests: XCTestCase {
    override func setUp() { super.setUp() }
    override func tearDown() { super.tearDown() }
    
    // MARK: - baseType
    
    func testBaseType() {
        // swiftformat:disable all
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
                
                // concrete types
                
                // -- core types
            case .int32:             XCTAssertEqual(valueType.baseType, .int32)
            case .float32:           XCTAssertEqual(valueType.baseType, .float32)
            case .string:            XCTAssertEqual(valueType.baseType, .string)
            case .blob:              XCTAssertEqual(valueType.baseType, .blob)
                
                // -- extended types
            case .int64:             XCTAssertEqual(valueType.baseType, .int64)
            case .timeTag:           XCTAssertEqual(valueType.baseType, .timeTag)
            case .double:            XCTAssertEqual(valueType.baseType, .double)
            case .stringAlt:         XCTAssertEqual(valueType.baseType, .stringAlt)
            case .character:         XCTAssertEqual(valueType.baseType, .character)
            case .midi:              XCTAssertEqual(valueType.baseType, .midi)
            case .bool:              XCTAssertEqual(valueType.baseType, .bool)
            case .null:              XCTAssertEqual(valueType.baseType, .null)
                
                // "meta" types
                
            case .number:               XCTAssertEqual(valueType.baseType, .number)
                
                // optional versions of concrete types
                
                // -- core types
            case .int32Optional:     XCTAssertEqual(valueType.baseType, .int32)
            case .float32Optional:   XCTAssertEqual(valueType.baseType, .float32)
            case .stringOptional:    XCTAssertEqual(valueType.baseType, .string)
            case .blobOptional:      XCTAssertEqual(valueType.baseType, .blob)
                
                // -- extended types
            case .int64Optional:     XCTAssertEqual(valueType.baseType, .int64)
            case .timeTagOptional:   XCTAssertEqual(valueType.baseType, .timeTag)
            case .doubleOptional:    XCTAssertEqual(valueType.baseType, .double)
            case .stringAltOptional: XCTAssertEqual(valueType.baseType, .stringAlt)
            case .characterOptional: XCTAssertEqual(valueType.baseType, .character)
            case .midiOptional:      XCTAssertEqual(valueType.baseType, .midi)
            case .boolOptional:      XCTAssertEqual(valueType.baseType, .bool)
            case .nullOptional:      XCTAssertEqual(valueType.baseType, .null)
                
                // -- meta types
                
            case .numberOptional:    XCTAssertEqual(valueType.baseType, .number)
                
            }
        }
        // swiftformat:enable all
    }
    
    // MARK: - isOptional
    
    func testIsOptional() {
        // swiftformat:disable all
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
                
                // optional versions of concrete types
                
                // -- core types
            case .int32Optional:     XCTAssertEqual(valueType.isOptional, true)
            case .float32Optional:   XCTAssertEqual(valueType.isOptional, true)
            case .stringOptional:    XCTAssertEqual(valueType.isOptional, true)
            case .blobOptional:      XCTAssertEqual(valueType.isOptional, true)
                
                // -- extended types
            case .int64Optional:     XCTAssertEqual(valueType.isOptional, true)
            case .timeTagOptional:   XCTAssertEqual(valueType.isOptional, true)
            case .doubleOptional:    XCTAssertEqual(valueType.isOptional, true)
            case .stringAltOptional: XCTAssertEqual(valueType.isOptional, true)
            case .characterOptional: XCTAssertEqual(valueType.isOptional, true)
            case .midiOptional:      XCTAssertEqual(valueType.isOptional, true)
            case .boolOptional:      XCTAssertEqual(valueType.isOptional, true)
            case .nullOptional:      XCTAssertEqual(valueType.isOptional, true)
                
                // -- meta types
                
            case .numberOptional:    XCTAssertEqual(valueType.isOptional, true)
                
            default:                 XCTAssertEqual(valueType.isOptional, false)
                
            }
        }
        // swiftformat:enable all
    }
    
    // MARK: - OSCValue.baseTypeMatches
    
    // MARK: ... Core types
    
    func testBaseTypeMatches_int32() {
        let val = OSCValue.int32(123)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .int32:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .int32, .number:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_float32() {
        let val = OSCValue.float32(123.45)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .float32:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .float32, .number:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_string() {
        let val = OSCValue.string("A string")
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .string: XCTAssertTrue(val.baseType(matches: valueType))
            default: XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .string:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_blob() {
        let val = OSCValue.blob(Data([1, 2, 3]))
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .blob:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .blob:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    // MARK: ... Extended types
    
    func testBaseTypeMatches_int64() {
        let val = OSCValue.int64(456)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .int64:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .int64, .number:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_timeTag() {
        let val = OSCValue.timeTag(.init(456))
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .timeTag:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .timeTag:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_double() {
        let val = OSCValue.double(456.78)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .double:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .double, .number:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_stringAlt() {
        let val = OSCValue.stringAlt("An alt string")
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .stringAlt:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .stringAlt:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_character() {
        let val = OSCValue.character("A")
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .character:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .character:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_midi() {
        let val = OSCValue.midi(portID: 0x00, status: 0x00, data1: 0x00, data2: 0x00)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .midi:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .midi:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_bool() {
        let val = OSCValue.bool(true)
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .bool:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .bool:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
    
    func testBaseTypeMatches_null() {
        let val = OSCValue.null
        
        // canMatchMetaTypes: false
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .null:
                XCTAssertTrue(val.baseType(matches: valueType))
            default:
                XCTAssertFalse(val.baseType(matches: valueType))
            }
        }
        
        // canMatchMetaTypes: true
        OSCValueMask.Token.allCases.forEach { valueType in
            switch valueType {
            case .null:
                XCTAssertTrue(val.baseType(matches: valueType, canMatchMetaTypes: true))
            default:
                XCTAssertFalse(val.baseType(matches: valueType, canMatchMetaTypes: true))
            }
        }
    }
}

#endif
