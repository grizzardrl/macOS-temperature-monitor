//
//  ContentView.swift
//  macos-temperature-monitor
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var my_BG_T = Background_Timer()
    
    var body: some View {
        VStack {
            Text("CPU Temp: \(my_BG_T.cpu_Temp_copy)F").frame(minWidth: 200, idealWidth: 600, maxWidth: .infinity, minHeight: 200, idealHeight: 400, maxHeight: .infinity, alignment: .center)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
