//
//  Node.m
//  UDApp
//
//  Created by Virl on 04/11/15.
//  Copyright © 2015 Underdark. All rights reserved.
//

#import "Node.h"

@import Underdark;

const int32_t appId = 234235;

@interface Node() <UDTransportDelegate>
{
	id<UDTransport> _transport;
	
}
@end

@implementation Node

- (instancetype) init
{
	if(!(self = [super init]))
		return self;
	
	int64_t buf = 0;
	do {
		arc4random_buf(&buf, sizeof(buf));
	} while (buf == 0);
	
	if(buf < 0) {
		buf = -buf;
	}
	
	_nodeId = buf;
	
	_transport = [UDUnderdark configureTransportWithAppId:appId nodeId:_nodeId delegate:self queue:dispatch_get_main_queue() kinds:@[@(UDTransportKindWifi), @(UDTransportKindBluetooth)]];
	
	return self;
}

- (void) start
{
	
}

- (void) stop
{
	
}

#pragma mark - UDTransportDelegate

@end
