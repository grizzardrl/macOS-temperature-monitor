//
//  CPU_Temp_XPC_Delegate.swift
//  CPU_Temp_XPC
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//
//  Based on the work of Matthew Miner
//  https://gist.github.com/mminer/be55bcdf7c4ff004ecafba6a664addc5
//

import Foundation

class CPU_Temp_XPC_Delegate: NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let exportedObject = CPU_Temp_XPC()
        newConnection.exportedInterface = NSXPCInterface(with: CPU_Temp_XPC_Protocol.self)
        newConnection.exportedObject = exportedObject
        newConnection.resume()
        return true
    }
}
