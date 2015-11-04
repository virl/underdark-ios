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
	NSMutableArray* _links;
	
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
	
	_links = [NSMutableArray array];
	
	NSArray* transportKinds = @[@(UDTransportKindWifi), @(UDTransportKindBluetooth)];
	
	_transport = [UDUnderdark configureTransportWithAppId:appId nodeId:_nodeId delegate:self queue:dispatch_get_main_queue() kinds:transportKinds];
	
	return self;
}

- (void) start
{
	[_controller updateFramesCount];
	[_controller updatePeersCount];
	
	[_transport start];
}

- (void) stop
{
	[_transport stop];
	
	_framesCount = 0;
	[_controller updateFramesCount];
}

- (void) broadcastFrame:(NSData*)frameData
{
	if(_links.count == 0)
		return;
	
	++_framesCount;
	[_controller updateFramesCount];
	
	for(id<UDLink> link in _links)
	{
		[link sendFrame:frameData];
	}
}

#pragma mark - UDTransportDelegate

- (void) transport:(id<UDTransport>)transport linkConnected:(id<UDLink>)link
{
	[_links addObject:link];
	++_peersCount;
	[_controller updatePeersCount];
}

- (void) transport:(id<UDTransport>)transport linkDisconnected:(id<UDLink>)link
{
	[_links removeObject:link];
	--_peersCount;
	[_controller updatePeersCount];
}

- (void) transport:(id<UDTransport>)transport link:(id<UDLink>)link didReceiveFrame:(NSData*)data
{
	++_framesCount;
	[_controller updateFramesCount];
}

@end
