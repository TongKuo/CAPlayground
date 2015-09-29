//
//  NormalContentView.m
//  CAPlayground
//
//  Created by Tong G. on 9/29/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "NormalContentView.h"

@implementation NormalContentView

- ( void ) awakeFromNib
    {
    NSImage* image = [ [ NSImage alloc ] initWithContentsOfFile: [ NSHomeDirectory() stringByAppendingString: @"/tmp/minions.jpg" ] ];

    NSImageView* imageView = [ [ NSImageView alloc ] initWithFrame: NSMakeRect( 0, 0, 50, 50 ) ];
    [ imageView configureForAutoLayout ];
    [ imageView setImage: image ];
    [ imageView setImageScaling: NSImageScaleAxesIndependently ];

    [ self addSubview: imageView ];
    [ imageView autoPinEdgesToSuperviewEdges ];
    }

@end
