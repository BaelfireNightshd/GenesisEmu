//
//  MyImage.swift
//  GenesisEmu
//
//  Created by Tad Parrish on 5/13/19.
//  Copyright © 2019 Tad Parrish. All rights reserved.
//

import CoreGraphics
import Cocoa

class MyImage {
    let width: Int
    let height: Int
    var size: NSSize {
        get {
            return NSSize(width: self.width, height: self.height)
        }
    }
    let context: CGContext
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bytesPerPixel = 4
    let bitsPerComponent = 8
    let bytesPerRow: Int
    let bitmapInfo = RGBA32.bitmapInfo
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        
        self.bytesPerRow = bytesPerPixel * width
        self.context = CGContext(data: nil, width: width, height: height, bitsPerComponent: self.bitsPerComponent, bytesPerRow: self.bytesPerRow, space: self.colorSpace, bitmapInfo: self.bitmapInfo)!
        self.context.interpolationQuality = .none
    }
    
    func writePixel(index: Int, color: RGBA32) {
        let buffer = context.data!
        let pixelBuffer = buffer.bindMemory(to: RGBA32.self, capacity: self.width * self.height)
        
        guard index < self.width * self.height else {
            fatalError("writePixel: index out of bounds")
        }
        
        pixelBuffer[index] = color
    }
    
    func writePixel(x: Int, y: Int, color: RGBA32) {
        let index = y * self.width + x
        writePixel(index: index, color: color)
    }
    
    func image() -> CGImage? {
        return context.makeImage()
    }
    
    // copy image piece
    static func copySquare(source: MyImage, dest: MyImage, sourceTop: Int, sourceLeft: Int, destTop: Int, destLeft: Int, width: Int, height: Int) {
        // TODO: implement copySquare
    }
    
    static func testImage(width: Int, height: Int) -> MyImage {
        let image = MyImage(width: width, height: height)
        
        for x in 0..<width {
            for y in 0..<height {
                let xPercentInt: UInt8 = UInt8(x * 255 / width)
                let yPercentInt: UInt8 = UInt8(y * 255 / height)
                let color = RGBA32(red: 0x00, green: xPercentInt, blue: yPercentInt, alpha: 0xff)
                
                image.writePixel(x: x, y: y, color: color)
            }
        }
        
        return image
    }
}
