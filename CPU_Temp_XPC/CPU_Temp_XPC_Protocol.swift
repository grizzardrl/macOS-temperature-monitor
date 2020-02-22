//
//  CPU_Temp_XPC_Protocol.swift
//  CPU_Temp_XPC
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//
//  Based on the work of Matthew Miner
//  https://gist.github.com/mminer/be55bcdf7c4ff004ecafba6a664addc5
//

import Foundation

@objc public protocol CPU_Temp_XPC_Protocol {
    func upperCaseString(_ string: String, withReply reply: @escaping (String) -> Void)
}

