//
//  UDUnderdark.h
//  Solidarity
//
//  Created by Virl on 29/06/15.
//  Copyright (c) 2015 Glint. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UDLogger.h"
#import "UDTransport.h"

typedef NS_ENUM(NSUInteger, UDTransportKind) {
	UDTransportKindWifi			= (1 << 0),
	UDTransportKindBluetooth	= (1 << 1)
};

@interface UDUnderdark : NSObject

+ (id<UDLogger>) logger;
+ (void) setLogger:(id<UDLogger>)logger;

+ (id<UDTransport>) configureTransportWithAppId:(int32_t)appId
										 nodeId:(int64_t)nodeId
									   delegate:(id<UDTransportDelegate>)delegate
										  queue:(dispatch_queue_t)queue
										  kinds:(NSArray*)kinds;

@end
