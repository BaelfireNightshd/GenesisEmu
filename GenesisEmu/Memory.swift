//
//  Memory.swift
//  GenesisEmu
//
//  Created by Tad Parrish on 7/9/20.
//  Copyright © 2020 Tad Parrish. All rights reserved.
//

import Foundation

struct Memory {
    let cart = Cartidge()
//    Start address     End address     Description
//    $000000           $3FFFFF         Cartridge ROM/RAM
//    $400000           $7FFFFF         Reserved (used by the Sega CD and 32x)
//    $800000           $9FFFFF         Reserved (used by the 32x?)
//    $A00000           $A0FFFF         Z80 addressing space
//    $A10000           $A10001         Version register (read-only word-long)
//    $A10002           $A10003         Controller 1 data
//    $A10004           $A10005         Controller 2 data
//    $A10006           $A10007         Expansion port data
//    $A10008           $A10009         Controller 1 control
//    $A1000A           $A1000B         Controller 2 control
//    $A1000C           $A1000D         Expansion port control
//    $A1000E           $A1000F         Controller 1 serial transmit
//    $A10010           $A10011         Controller 1 serial receive
//    $A10012           $A10013         Controller 1 serial control
//    $A10014           $A10015         Controller 2 serial transmit
//    $A10016           $A10017         Controller 2 serial receive
//    $A10018           $A10019         Controller 2 serial control
//    $A1001A           $A1001B         Expansion port serial transmit
//    $A1001C           $A1001D         Expansion port serial receive
//    $A1001E           $A1001F         Expansion port serial control
//    $A10020           $A10FFF         Reserved
//    $A11000                           Memory mode register
//    $A11002           $A110FF         Reserved
//    $A11100           $A11101         Z80 bus request
//    $A11102           $A111FF         Reserved
//    $A11200           $A11201         Z80 reset
//    $A11202           $A13FFF         Reserved
//    $A14000           $A14003         TMSS register
//    $A14004           $BFFFFF         Reserved
//    $C00000                           VDP Data Port
//    $C00002                           VDP Data Port (Mirror)
//    $C00004                           VDP Control Port
//    $C00006                           VDP Control Port (Mirror)
//    $C00008                           H/V Counter
//    $C0000A                           H/V Counter (Mirror)
//    $C0000C                           H/V Counter (Mirror)
//    $C0000E                           H/V Counter (Mirror)
//    $C00011                           SN76489 PSG
//    $C00013                           SN76489 PSG (Mirror)
//    $C00015                           SN76489 PSG (Mirror)
//    $C00017                           SN76489 PSG (Mirror)
//    $C0001C                           Disable/Debug register
//    $C0001E                           Disable/Debug register (Mirror)
//    $C0001E           $FEFFFF         Reserved
//    $FF0000           $FFFFFF         68000 RAM
    
    func readLong(address: UInt32) -> UInt32 {
        let high = readWord(address: address)
        let low = readWord(address: address + 2)
        return BitTwiddling.uInt16toUInt32(high: high, low: low)
    }
    
    func readWord(address: UInt32) -> UInt16 {
        let high = readByte(address: address)
        let low = readByte(address: address + 1)
        return BitTwiddling.uInt8toUInt16(high: high, low: low)
    }
    
    func readByte(address: UInt32) -> UInt8 {
        var data: UInt8 = 0xff
        
        switch address {
        case 0x000000..<0x400000:
            data = cart.readByte(address: address)
        default: print("address 0x\(String(format: "%06X", address)) is unimplemented in Memory.swift")
        }
        return data
    }
}
