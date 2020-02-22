//
//  XPC_Tester.swift
//  macos-temperature-monitor
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//

import Foundation
import CPU_Temp_XPC

class XPC_Tester: ObservableObject {
    
    var inputString = ""
    @Published var returnedString = ""
    
    func setInputString(input: String) {
        self.inputString = input
    }
    
    func XPC_Test(input: String) {
        let connection = NSXPCConnection(serviceName: "com.grizz.CPU-Temp-XPC")
        connection.remoteObjectInterface = NSXPCInterface(with: CPU_Temp_XPC_Protocol.self)
        connection.resume()

        let service = connection.remoteObjectProxyWithErrorHandler { error in
            print("Received error:", error)
        } as? CPU_Temp_XPC_Protocol

        service?.upperCaseString(input) { response in
            print("Response from XPC service:", response)
//            Wrapping the assignment in the DispatchQueue avoids the warning:
//            Publishing changes from background threads is not allowed;
//            make sure to publish values from the main thread (via operators like receive(on:)) on model updates.
            DispatchQueue.main.async {
                self.returnedString = response
            }
            
        }
    }
    
}
