//
//  LayerHostingContentView.m
//  CAPlayground
//
//  Created by Tong G. on 9/29/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "LayerHostingContentView.h"
#import "HostingLayer.h"
#import "ImageLayer.h"

@implementation LayerHostingContentView
    {
    ImageLayer* __imageLayer__pureWiki;
    ImageLayer* __imageLayer__minions;
    }

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
    [ hostingLayer setSpeed: .5f ];

    self->__imageLayer__pureWiki = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"purewiki" ] ];
//    [ self->__imageLayer__pureWiki setPosition: NSMakePoint( 300, 100 ) ];
//    [ self->__imageLayer__pureWiki setBounds: CGRectMake( 0, 0, 460, 290 ) ];
//    [ self->__imageLayer__pureWiki setAnchorPoint: NSMakePoint( 0.f, 0.f ) ];
    [ hostingLayer addSublayer: self->__imageLayer__pureWiki ];
    [ self->__imageLayer__pureWiki setSpeed: .5f ];

    self->__imageLayer__minions = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"minions" ] ];
//    [ self->__imageLayer__minions setPosition: NSMakePoint( 400, 50 ) ];
//    [ self->__imageLayer__minions setBounds: CGRectMake( 0, 0, 460, 300 ) ];
//    [ self->__imageLayer__minions setAnchorPoint: NSMakePoint( 0.f, 0.f ) ];
    [ hostingLayer addSublayer: self->__imageLayer__minions ];

    [ hostingLayer setLayoutManager: [ CAConstraintLayoutManager layoutManager ] ];

    [ self->__imageLayer__pureWiki addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintWidth relativeTo: @"superlayer" attribute: kCAConstraintWidth scale: .4f offset: 0.f ] ];

    [ self->__imageLayer__pureWiki addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintHeight relativeTo: @"superlayer" attribute: kCAConstraintHeight scale: .4f offset: 0.f ] ];

    [ self->__imageLayer__minions addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintWidth relativeTo: @"superlayer" attribute: kCAConstraintWidth scale: .4f offset: 0.f ] ];

    [ self->__imageLayer__minions addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintHeight relativeTo: @"superlayer" attribute: kCAConstraintHeight scale: .4f offset: 0.f ] ];

    [ self->__imageLayer__pureWiki addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintMidX relativeTo: @"superlayer" attribute: kCAConstraintMidX ] ];

    [ self->__imageLayer__pureWiki addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintMidY relativeTo: @"superlayer" attribute: kCAConstraintMidY ] ];

    [ self->__imageLayer__minions addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintMidX relativeTo: @"purewiki" attribute: kCAConstraintMidX offset: 50.f ] ];

    [ self->__imageLayer__minions addConstraint:
        [ CAConstraint constraintWithAttribute: kCAConstraintMidY relativeTo: @"purewiki" attribute: kCAConstraintMidY offset: -50.f ] ];

    [ self setLayer: hostingLayer ];
    [ self setWantsLayer: YES ];
    [ self.layer setNeedsDisplay ];
    }

- ( IBAction ) animateAction: ( id )_Sender
    {
//    CABasicAnimation* fadeOutAnim = [ CABasicAnimation animationWithKeyPath: @"opacity" ];
//    [ fadeOutAnim setFromValue: @( self.layer.opacity ) ];
//    [ fadeOutAnim setToValue: @0.f ];
//    [ fadeOutAnim setDuration: 16.f ];
//    [ self.layer setOpacity: 0.f ];
//
//    CABasicAnimation* cornerRadiusAnim = [ CABasicAnimation animationWithKeyPath: @"cornerRadius" ];
//    [ cornerRadiusAnim setFromValue: @( self.layer.cornerRadius ) ];
//    [ cornerRadiusAnim setToValue: @200.f ];
//    [ cornerRadiusAnim setDuration: 16.f ];
//    [ self.layer setCornerRadius: 200.f ];

//    CAKeyframeAnimation* contentsAnim = [ CAKeyframeAnimation animationWithKeyPath: @"contents" ];
//    [ contentsAnim setValues: @[ [ NSImage imageNamed: @"purewiki" ]
//                               , [ NSImage imageNamed: @"minions" ]
//                               , [ NSImage imageNamed: @"galaxy" ]
//                               , [ NSImage imageNamed: @"rango" ]
//                               , [ NSImage imageNamed: @"jobs" ]
//                               ] ];
//
//    [ contentsAnim setKeyTimes: @[ @.2f, @.4f, @.6f, @.8f, @1.f ] ];
//
//    [ self.layer setContents: [ NSImage imageNamed: @"jobs" ] ];
//    [ contentsAnim setDuration: 10.f ];

//    [ self.layer addAnimation: fadeOutAnim forKey: @"opacity" ];
//    [ self.layer addAnimation: cornerRadiusAnim forKey: @"cornerRadius" ];
//    [ self.layer addAnimation: contentsAnim forKey: @"contents" ];

    CAKeyframeAnimation* contentsRectAnim = [ CAKeyframeAnimation animationWithKeyPath: @"contentsRect" ];
    [ contentsRectAnim setValues: @[ [ NSValue valueWithRect: NSMakeRect( 0, 0, 1.f, 1.f ) ]
                                   , [ NSValue valueWithRect: NSMakeRect( .2f, .2f, .8f, .8f ) ]
                                   , [ NSValue valueWithRect: NSMakeRect( .4f, .4f, .6f, .6f ) ]
                                   , [ NSValue valueWithRect: NSMakeRect( .5f, .5f, .4f, .4f ) ]
                                   , [ NSValue valueWithRect: NSMakeRect( .5f, .5f, .5f, .5f ) ]
                                   ] ];

    [ contentsRectAnim setKeyTimes: @[ @0.f, @0.1, @.2, @.3, @1.f ] ];
    [ contentsRectAnim setDuration: 10.f ];
    [ contentsRectAnim setCalculationMode: kCAAnimationLinear ];

    [ self->__imageLayer__pureWiki addAnimation: contentsRectAnim forKey: @"contentsRect" ];
    [ self->__imageLayer__pureWiki setContentsRect: NSMakeRect( .5f, .5f, .5f, .5f ) ];

    [ self->__imageLayer__minions addAnimation: contentsRectAnim forKey: @"contentsRect" ];
    [ self->__imageLayer__minions setContentsRect: NSMakeRect( .5f, .5f, .5f, .5f ) ];

//
//    NSLog( @"Layer Tree: Opacity( %g ) vs. Corner Radius( %g )", self.layer.opacity, self.layer.cornerRadius );
//
//    CALayer* presLayer = ( CALayer* )self.layer.presentationLayer;
//    NSLog( @"Presentation Tree: Opacity( %g ) vs. Corner Radius( %g )", presLayer.opacity, presLayer.cornerRadius );

//    [ NSTimer scheduledTimerWithTimeInterval: .2f target: self selector: @selector( __printPresentationLayer: ) userInfo: nil repeats: YES ];
    }

- ( void ) __printPresentationLayer: ( NSTimer* )_Timer
    {
    CALayer* presLayer = ( CALayer* )self.layer.presentationLayer;
    NSLog( @"Presentation Tree: %@", NSStringFromRect( presLayer.contentsRect ) );
//    NSLog( @"Presentation Tree: Opacity( %g ) vs. Corner Radius( %g )", presLayer.opacity, presLayer.cornerRadius );
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
