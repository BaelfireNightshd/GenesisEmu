//
//  Cartridge.swift
//  GenesisEmu
//
//  Created by Tad Parrish on 7/10/20.
//  Copyright © 2020 Tad Parrish. All rights reserved.
//

import Foundation

struct Cartidge {
    
    let file: FileHandle?
    
    init() {
        #warning("Don't leave hard coded path")
        let fileURL = URL(fileURLWithPath: "../../../../../../../../Documents/Apple Development/macOS/GenesisEmu/Documentation/Sonic The Hedgehog (USA, Europe).md")
        do {
            file = try FileHandle(forReadingFrom: fileURL)
        } catch {
            file = nil
            print(error)
        }
    }
    
    func readByte(address: UInt32) -> UInt8 {
        #warning("Not Implemented yet")
        file?.seek(toFileOffset: UInt64(address))
        let value = file?.readData(ofLength: 1)
        return value?.first ?? 0xff
    }
    
    func write(address:UInt32, data: UInt16) {
        #warning("Not Implemented yet")
    }
}
