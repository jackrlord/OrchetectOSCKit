//
//  OSCValueToken Methods Tests.swift
//  OSCKit • https://github.com/orchetect/OSCKit
//  © 2020-2024 Steffan Andrews • Licensed under MIT License
//

@testable import OSCKitCore
import SwiftASCII
import XCTest

final class OSCValueTokenMethods_Tests: XCTestCase {
    override func setUp() { super.setUp() }
    override func tearDown() { super.tearDown() }
    
    // MARK: - OSCValueToken.isBaseType(matching:)
    
    // MARK: ... Core types
    
    func testBaseTypeMatches_blob() {
        let val: any OSCValue = Data([1, 2, 3])
        let valType: OSCValueToken = .blob
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_float32() {
        let val: any OSCValue = Float32(123.45)
        let valType: OSCValueToken = .float32
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType, .number:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_int32() {
        let val: any OSCValue = Int32(123)
        let valType: OSCValueToken = .int32
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType, .number:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_string() {
        let val: any OSCValue = String("A string")
        let valType: OSCValueToken = .string
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    // MARK: ... Extended types
    
    func testBaseTypeMatches_array() {
        let val: any OSCValue = OSCArrayValue([Int32(123)])
        let valType: OSCValueToken = .array
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_bool() {
        let val: any OSCValue = true
        let valType: OSCValueToken = .bool
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_character() {
        let val: any OSCValue = Character("A")
        let valType: OSCValueToken = .character
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_double() {
        let val: any OSCValue = Double(456.78)
        let valType: OSCValueToken = .double
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType, .number:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_int64() {
        let val: any OSCValue = Int64(456)
        let valType: OSCValueToken = .int64
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType, .number:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_impulse() {
        let val: any OSCValue = OSCImpulseValue()
        let valType: OSCValueToken = .impulse
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_midi() {
        let val: any OSCValue = OSCMIDIValue(portID: 0x00, status: 0x00, data1: 0x00, data2: 0x00)
        let valType: OSCValueToken = .midi
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_null() {
        let val: any OSCValue = OSCNullValue()
        let valType: OSCValueToken = .null
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_stringAlt() {
        let val: any OSCValue = OSCStringAltValue("An alt string")
        let valType: OSCValueToken = .stringAlt
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    func testBaseTypeMatches_timeTag() {
        let val: any OSCValue = OSCTimeTag(.init(456))
        let valType: OSCValueToken = .timeTag
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
    
    // MARK: ... Opaque types
    
    func testBaseTypeMatches_number() {
        let val: any OSCValueMaskable = AnyOSCNumberValue(123)
        let valType: OSCValueToken = .number
        
        // includingOpaque: false
        for token in OSCValueToken.allCases {
            switch token {
            case valType:
                XCTAssertTrue(val.oscValueToken.isBaseType(matching: token))
            default:
                XCTAssertFalse(val.oscValueToken.isBaseType(matching: token), "\(token)")
            }
        }
        
        // includingOpaque: true
        for token in OSCValueToken.allCases {
            switch token {
            case valType, .number:
                XCTAssertTrue(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true)
                )
            default:
                XCTAssertFalse(
                    val.oscValueToken
                        .isBaseType(matching: token, includingOpaque: true),
                    "\(token)"
                )
            }
        }
    }
}
