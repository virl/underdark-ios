//
//  Node.h
//  UDApp
//
//  Created by Virl on 04/11/15.
//  Copyright © 2015 Underdark. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewController.h"

@interface Node : NSObject

@property (nonatomic, readonly) int64_t nodeId;
@property (nonatomic, weak) ViewController* controller;

@end
