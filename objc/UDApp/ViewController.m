//
//  ViewController.m
//  UDApp
//
//  Created by Virl on 04/11/15.
//  Copyright © 2015 Underdark. All rights reserved.
//

#import "ViewController.h"

#import "Node.h"

@interface ViewController ()
{
	Node* _node;
}

@property (weak, nonatomic) IBOutlet UILabel *peersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *framesCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendFramesButton;

@end

@implementation ViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
	if(!(self = [super initWithCoder:aDecoder]))
		return self;
	
	_node = [[Node alloc] init];
	_node.controller = self;
	[_node start];
	
	return self;
}

- (void) dealloc
{
	[_node stop];
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void) updatePeersCount {
	_peersCountLabel.text = [NSString stringWithFormat:@"%d connected", _node.peersCount];
}

- (void) updateFramesCount {
	_framesCountLabel.text = [NSString stringWithFormat:@"%d frames", _node.framesCount];
}

- (IBAction)sendFrames:(id)sender {
	for(int32_t i = 0; i < 100; ++i)
	{
		NSMutableData* frameData = [[NSMutableData alloc] initWithLength:1024];
		arc4random_buf(frameData.mutableBytes, frameData.length);
		
		[_node broadcastFrame:frameData];
	}
}

@end
