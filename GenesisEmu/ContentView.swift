//
//  ContentView.swift
//  GenesisEmu
//
//  Created by Tad Parrish on 7/8/20.
//  Copyright © 2020 Tad Parrish. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let myImage = MyImage.testImage(width: 16, height: 16)
    
    var body: some View {
        Image(myImage.image()!, scale: 0.05, label: Text("My Image"))
            .interpolation(.none)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
