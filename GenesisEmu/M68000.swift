//
//  M68000.swift
//  GenesisEmu
//
//  Created by Tad Parrish on 7/8/20.
//  Copyright © 2020 Tad Parrish. All rights reserved.
//

import Foundation

struct M68000 {
    // Data Registers
    var dRegs = Array<UInt32>(repeating: 0x0, count: 8)
    
    // Address Registers
    var aRegs = Array<UInt32>(repeating: 0x0, count: 7)
    var uspReg = UInt32(0)
    var sspReg = UInt32(0)
    
    // Program counter
    var pcReg = UInt32(0)
    
    // Condition code register
    var condReg = UInt16(0)
    
    let memory: Memory
    
    init() {
        memory = Memory()
        pcReg = memory.readLong(address: 0x000004)
        uspReg = memory.readLong(address: 0x000000)
        print("PC: \(String(format: "%06X", pcReg))")
        print("USP: \(String(format: "%06X", uspReg))")
    }
    
    
    
    func step() {
        
    }
}
