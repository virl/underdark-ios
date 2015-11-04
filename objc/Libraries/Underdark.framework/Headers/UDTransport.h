//
//  UDTransport.h
//  Solidarity
//
//  Created by Virl on 14/02/15.
//  Copyright (c) 2015 Glint. All rights reserved.
//

#ifndef Underdark_UDTransport_h
#define Underdark_UDTransport_h

#import "UDLink.h"

extern NSString* UDBluetoothRequiredNotification;
extern NSString* UDBeaconDetectedNotification;

@protocol UDTransport;

@protocol UDTransportDelegate <NSObject>

- (void) transport:(id<UDTransport>)transport linkConnected:(id<UDLink>)link;
- (void) transport:(id<UDTransport>)transport linkDisconnected:(id<UDLink>)link;

- (void) transport:(id<UDTransport>)transport link:(id<UDLink>)link didReceiveFrame:(NSData*)data;

@end

@protocol UDTransport <NSObject>

- (void) start;
- (void) stop;

@end

#endif
