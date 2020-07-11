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
    
    static func uInt16toUInt32(high: UInt16, low: UInt16) -> UInt32 {
        var value: UInt32 = 0
        value |= UInt32(low)
        value |= UInt32(high) << 16
        return value
    }
    
    static func uInt8toUInt32(high: UInt8, _ hMid: UInt8, _ lMid: UInt8, low: UInt8) -> UInt32 {
        let high16 = uInt8toUInt16(high: high, low: hMid)
        let low16 = uInt8toUInt16(high: lMid, low: low)
        let value = uInt16toUInt32(high: high16, low: low16)
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
