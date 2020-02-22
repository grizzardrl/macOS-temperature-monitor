//
//  ContentView.swift
//  macos-temperature-monitor
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var my_XPCTester = XPC_Tester()
    @State private var textFieldInput = ""
    
    @ObservedObject var my_BG_T = Background_Timer()
    
    var body: some View {
        VStack {
            Text("Counter value: \(my_BG_T.counter)")
            TextField("Enter text", text: $textFieldInput)
            Text("Output text: \(my_XPCTester.returnedString)").frame(minWidth: 600, minHeight: 20, alignment: .center)
            Button(action: {
                self.my_XPCTester.setInputString(input: self.textFieldInput)
                self.my_XPCTester.XPC_Test(input: self.textFieldInput)
            }) {
                Text("Convert")
            }
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
