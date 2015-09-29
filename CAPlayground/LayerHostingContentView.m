//
//  LayerHostingContentView.m
//  CAPlayground
//
//  Created by Tong G. on 9/29/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "LayerHostingContentView.h"

@implementation LayerHostingContentView

- ( void ) viewDidMoveToSuperview
    {
    NSButton* animateButton = [ [ NSButton alloc ] initWithFrame: NSMakeRect( 0.f, 0.f, 30.f, 50.f ) ];
    [ animateButton setBezelStyle: NSTexturedRoundedBezelStyle ];
    [ animateButton setTitle: @"Animate" ];
    [ animateButton setTarget: self ];
    [ animateButton setAction: @selector( animateAction: ) ];

    [ animateButton configureForAutoLayout ];
    [ self addSubview: animateButton ];
    [ animateButton autoAlignAxis: ALAxisHorizontal toSameAxisOfView: self ];
    [ animateButton autoAlignAxis: ALAxisVertical toSameAxisOfView: self ];
    }

- ( void ) awakeFromNib
    {
    [ self setWantsLayer: YES ];

    CALayer* hostingLayer = [ CALayer layer ];
    NSImage* image = [ [ NSImage alloc ] initWithContentsOfFile: [ NSHomeDirectory() stringByAppendingString: @"/tmp/minions.jpg" ] ];
    [ hostingLayer setContents: [ image layerContentsForContentsScale: 2.f ] ];

    [ self setLayer: hostingLayer ];
    }

- ( IBAction ) animateAction: ( id )_Sender
    {
    CABasicAnimation* basicAnim = [ CABasicAnimation animationWithKeyPath: @"contents" ];
    [ basicAnim setDuration: 6.f ];
    [ basicAnim setFromValue: self.layer.contents ];
    [ basicAnim setToValue: nil ];
    [ self.layer addAnimation: basicAnim forKey: @"contents" ];

    [ self.layer setContents: nil ];
    }

@end
