//
//  BitTwiddling.swift
//  GameboyEmulator
//
//  Created by Tad Parrish on 5/21/19.
//  Copyright © 2019 Tad Parrish. All rights reserved.
//

import Foundation

class BitTwiddling {
    static func uInt8toUInt16(high: UInt8, low: UInt8) -> UInt16 {
        var value: UInt16 = 0
        value |= UInt16(low)
        value |= UInt16(high) << 8
        return value
    }
    
    static func signExtendUInt8toInt(_ value: UInt8) -> Int {
        if (value & 0x80 == 0x80) { // if negative
            let leadingBits = UInt.max ^ 0xFF
            return Int(bitPattern: leadingBits | UInt(value))
        }
        else {
            return Int(value)
        }
    }
}
