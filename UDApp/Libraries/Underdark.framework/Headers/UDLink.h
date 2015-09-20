//
//  UDLink.h
//  Underdark
//
//  Created by Virl on 01/07/15.
//  Copyright (c) 2015 Underdark. All rights reserved.
//

#ifndef Underdark_UDLink_h
#define Underdark_UDLink_h

@protocol UDLink <NSObject>

@property (nonatomic, readonly) int64_t nodeId;
@property (nonatomic, readonly) int16_t priority;	// Lower value means higher priority (like unix nice).

@property (nonatomic, readonly) bool slowLink;

- (void) sendFrame:(NSData*)data;
- (void) disconnect;

@end


#endif
