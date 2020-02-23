//
//  CPU_Temp_Handler.swift
//  macos-temperature-monitor
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//

import Foundation
import CPU_Temp_XPC

class CPU_Temp_Handler {
    
    var CPU_Temp = ""
    
    func setCPUTemp() {
        let connection = NSXPCConnection(serviceName: "com.grizz.CPU-Temp-XPC")
        connection.remoteObjectInterface = NSXPCInterface(with: CPU_Temp_XPC_Protocol.self)
        connection.resume()
        
        let service = connection.remoteObjectProxyWithErrorHandler { error in
            print("Received error:", error)
        } as? CPU_Temp_XPC_Protocol
        
        service?.getCPUTemp() { response in
            self.CPU_Temp = response
        }
    }
}


