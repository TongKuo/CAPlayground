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
    CABasicAnimation* fadeOutAnim = [ CABasicAnimation animationWithKeyPath: @"opacity" ];
    [ fadeOutAnim setFromValue: @( self.layer.opacity ) ];
    [ fadeOutAnim setToValue: @0.f ];
    [ fadeOutAnim setDuration: 6.f ];
    [ self.layer setOpacity: 0.f ];

    CABasicAnimation* cornerRadiusAnim = [ CABasicAnimation animationWithKeyPath: @"cornerRadius" ];
    [ cornerRadiusAnim setFromValue: @( self.layer.cornerRadius ) ];
    [ cornerRadiusAnim setToValue: @200.f ];
    [ cornerRadiusAnim setDuration: 6.f ];
    [ self.layer setCornerRadius: 200.f ];

    [ self.layer addAnimation: fadeOutAnim forKey: @"opacity" ];
    [ self.layer addAnimation: cornerRadiusAnim forKey: @"cornerRadius" ];

    NSLog( @"Layer Tree: Opacity( %g ) vs. Corner Radius( %g )", self.layer.opacity, self.layer.cornerRadius );

    CALayer* presLayer = ( CALayer* )self.layer.presentationLayer;
    NSLog( @"Presentation Tree: Opacity( %g ) vs. Corner Radius( %g )", presLayer.opacity, presLayer.cornerRadius );

    [ NSTimer scheduledTimerWithTimeInterval: .2f target: self selector: @selector( __printPresentationLayer: ) userInfo: nil repeats: YES ];
    }

- ( void ) __printPresentationLayer: ( NSTimer* )_Timer
    {
    CALayer* presLayer = ( CALayer* )self.layer.presentationLayer;
    NSLog( @"Presentation Tree: Opacity( %g ) vs. Corner Radius( %g )", presLayer.opacity, presLayer.cornerRadius );
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
