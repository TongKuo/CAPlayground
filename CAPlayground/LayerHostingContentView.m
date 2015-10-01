//
//  LayerHostingContentView.m
//  CAPlayground
//
//  Created by Tong G. on 9/29/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "LayerHostingContentView.h"
#import "HostingLayer.h"

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
    HostingLayer* hostingLayer = [ HostingLayer layer ];
    [ hostingLayer setDelegate: self ];

    [ self setLayer: hostingLayer ];
    [ self setWantsLayer: YES ];
    [ self.layer setNeedsDisplay ];
    }

- ( IBAction ) animateAction: ( id )_Sender
    {
    CABasicAnimation* basicAnim = [ CABasicAnimation animationWithKeyPath: @"cornerRadius" ];
    [ basicAnim setFromValue: @0.f ];
    [ basicAnim setToValue: @200.f ];
    [ basicAnim setDuration: 6.f ];
    [ self.layer addAnimation: basicAnim forKey: @"cornerRadius" ];

    [ self.layer setCornerRadius: 200.f ];

    NSLog( @"Layer in Model Tree: %g", self.layer.cornerRadius );
    NSLog( @"Layer in Presentation Tree: %g", [ ( CALayer* )self.layer.presentationLayer cornerRadius ] );
    }

- ( BOOL ) mouseDownCanMoveWindow
    {
    return YES;
    }

- ( BOOL )               layer: ( CALayer* )_Layer
    shouldInheritContentsScale: ( CGFloat )_NewScale
                    fromWindow: ( NSWindow* )_Window
    {
    NSLog( @"%g vs. %g", self.layer.contentsScale, _NewScale );

    return YES;
    }

@end
