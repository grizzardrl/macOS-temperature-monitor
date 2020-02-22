//
//  CPU_Temp_XPC.h
//  CPU_Temp_XPC
//
//  Created by Robert Grizzard on 2/22/20.
//  Copyright © 2020 Robert Grizzard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPU_Temp_XPCProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface CPU_Temp_XPC : NSObject <CPU_Temp_XPCProtocol>
@end
