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

#define __CA_TRANSACTION_BEGIN__ [ CATransaction begin ];
#define __CA_TRANSACTION_COMMIT__ [ CATransaction commit ];

@implementation LayerHostingContentView
    {
    ImageLayer* __imageLayer__pureWiki;
    ImageLayer* __imageLayer__minions;
    ImageLayer* __imageLayer__rango;
    ImageLayer* __imageLayer__jobs;
    }

- ( void ) awakeFromNib
    {
    HostingLayer* hostingLayer = [ HostingLayer layer ];
    [ hostingLayer setDelegate: self ];
    [ hostingLayer setSpeed: .5f ];

    // Testing Basic Animations
    self->__imageLayer__pureWiki = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"purewiki" ] frame: NSZeroRect ];
    [ hostingLayer addSublayer: self->__imageLayer__pureWiki ];
    [ self->__imageLayer__pureWiki setSpeed: .5f ];

    self->__imageLayer__minions = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"minions" ] frame: NSZeroRect ];
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
    [ self.layer setSpeed: 1.f ];

    // Testing Transition Animations
    self->__imageLayer__rango = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"rango" ] frame: NSMakeRect( 0, 0, 200, 100 ) ];
    [ self.layer addSublayer: self->__imageLayer__rango ];

    self->__imageLayer__jobs = [ [ ImageLayer alloc ] initWithImage: [ NSImage imageNamed: @"jobs" ] frame: NSMakeRect( 0, 0, 200, 100 ) ];
    [ self.layer addSublayer: self->__imageLayer__jobs ];
    [ self->__imageLayer__jobs setHidden: YES ];

    CATransition* removeAnim = [ CATransition animation ];
    [ removeAnim setDuration: 5.f ];
    [ removeAnim setStartProgress: 0.f ];
    [ removeAnim setStartProgress: 1.f ];

    [ removeAnim setType: kCATransitionFade ];
    [ removeAnim setSubtype: kCATransitionFromBottom ];

    [ self.layer setActions: @{ @"transition" : removeAnim } ];
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

    __CA_TRANSACTION_BEGIN__
        [ CATransaction setAnimationDuration: 10.f ];
        [ CATransaction setDisableActions: YES ];
        [ CATransaction setCompletionBlock:
             ^( void )
                {
                NSLog( @"🍉" );
                } ];

        CAKeyframeAnimation* contentsRectAnim = [ CAKeyframeAnimation animationWithKeyPath: @"contentsRect" ];
        [ contentsRectAnim setValues: @[ [ NSValue valueWithRect: NSMakeRect( 0, 0, 1.f, 1.f ) ]
                                       , [ NSValue valueWithRect: NSMakeRect( .2f, .2f, .8f, .8f ) ]
                                       , [ NSValue valueWithRect: NSMakeRect( .4f, .4f, .6f, .6f ) ]
                                       , [ NSValue valueWithRect: NSMakeRect( .5f, .5f, .4f, .4f ) ]
                                       , [ NSValue valueWithRect: NSMakeRect( .5f, .5f, .5f, .5f ) ]
                                       ] ];

        [ contentsRectAnim setKeyTimes: @[ @0.f, @0.1, @.2, @.3, @1.f ] ];
    //    [ contentsRectAnim setDuration: 10.f ];
        [ contentsRectAnim setCalculationMode: kCAAnimationLinear ];

        [ self->__imageLayer__pureWiki setContentsRect: NSMakeRect( .5f, .5f, .5f, .5f ) ];
        [ self->__imageLayer__pureWiki addAnimation: contentsRectAnim forKey: @"contentsRect" ];

        [ self->__imageLayer__minions setContentsRect: NSMakeRect( .5f, .5f, .5f, .5f ) ];
        [ self->__imageLayer__minions addAnimation: contentsRectAnim forKey: @"contentsRect" ];

        __CA_TRANSACTION_BEGIN__
            [ CATransaction setAnimationDuration: 2.f ];
            [ CATransaction setDisableActions: NO ];
            [ self->__imageLayer__minions setCornerRadius: 20.f ];
            [ self->__imageLayer__minions setMasksToBounds: YES ];

            NSPoint savedPos = self->__imageLayer__minions.position;

            __CA_TRANSACTION_BEGIN__
                [ CATransaction setCompletionBlock:
                    ^( void )
                        {
                        __CA_TRANSACTION_BEGIN__
                        [ CATransaction setAnimationDuration: 2.f ];
                        [ self->__imageLayer__minions setCornerRadius: 0.f ];
                        [ self->__imageLayer__minions setPosition: savedPos ];
                        __CA_TRANSACTION_COMMIT__
                        } ];

                [ self->__imageLayer__minions setPosition: NSMakePoint( 0, 0 ) ];
            __CA_TRANSACTION_COMMIT__
        __CA_TRANSACTION_COMMIT__

//        CGFloat eyePosition = 1.f;
//        CATransform3D perspective = CATransform3DIdentity;
//        perspective.m34 = -1.0/eyePosition;
//
//        // Apply the transform to a parent layer.
//        self.layer.sublayerTransform = perspective;
//        [ self->__imageLayer__minions setZPosition: 1.f ];

    __CA_TRANSACTION_COMMIT__
//
//    NSLog( @"Layer Tree: Opacity( %g ) vs. Corner Radius( %g )", self.layer.opacity, self.layer.cornerRadius );
//
//    CALayer* presLayer = ( CALayer* )self.layer.presentationLayer;
//    NSLog( @"Presentation Tree: Opacity( %g ) vs. Corner Radius( %g )", presLayer.opacity, presLayer.cornerRadius );

//    [ NSTimer scheduledTimerWithTimeInterval: .2f target: self selector: @selector( __printPresentationLayer: ) userInfo: nil repeats: YES ];
    }

- ( void ) pauseLayer: ( CALayer* )_Layer
    {
    CFTimeInterval pausedTime = [ _Layer convertTime: CACurrentMediaTime() fromLayer: nil ];
    [ _Layer setSpeed: 0.f ];
    [ _Layer setTimeOffset: pausedTime ];
    }

- ( void ) resumeLayer: ( CALayer* )_Layer
    {
    CFTimeInterval pausedTime = [ _Layer timeOffset ];

    [ _Layer setSpeed: 1.f ];
    [ _Layer setTimeOffset: 0.f ];
    [ _Layer setBeginTime: 0.f ];

    CFTimeInterval timeSincePause = [ _Layer convertTime: CACurrentMediaTime() fromLayer: nil ] - pausedTime;
    [ _Layer setBeginTime: timeSincePause ];
    }

- ( IBAction ) slideIOActionWithStandardTransition: ( id )_Sender
    {
    __CA_TRANSACTION_BEGIN__
        [ CATransaction setCompletionBlock:
            ^( void )
                {
                NSLog( @"🍌" );
                } ];

        BOOL yesOrNo = self->__imageLayer__rango.hidden;

        CATransition* slideIOTransition = [ CATransition animation ];
        [ slideIOTransition setType: yesOrNo ? kCATransitionReveal : kCATransitionMoveIn ];
        [ slideIOTransition setSubtype: yesOrNo ? kCATransitionFromLeft : kCATransitionFromRight ];
        [ slideIOTransition setDuration: .5f ];
        [ slideIOTransition setStartProgress: 0.f ];
        [ slideIOTransition setEndProgress: 1.f ];

        [ slideIOTransition setFillMode: kCAFillModeBackwards ];

        [ slideIOTransition setTimingFunction: [ CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut ] ];

        [ self->__imageLayer__rango setHidden: !yesOrNo ];
        [ self->__imageLayer__jobs setHidden: yesOrNo ];

        [ self->__imageLayer__rango addAnimation: slideIOTransition forKey: @"transition" ];
        [ self->__imageLayer__jobs addAnimation: slideIOTransition forKey: @"transition" ];
    __CA_TRANSACTION_COMMIT__
    }

- ( IBAction ) timingPlaygroundAction: ( id )_Sender
    {
    [ self.layer setSpeed: 1.f ];
    CFTimeInterval currentAbsoluteTime = CACurrentMediaTime();
    CFTimeInterval localLayerTime = [ self.layer convertTime: currentAbsoluteTime fromLayer: nil ];

    NSLog( @"%g vs. %g", currentAbsoluteTime, localLayerTime );
    }

- ( IBAction ) removeLayersAction: ( id )_Sender
    {
    [ self->__imageLayer__minions removeFromSuperlayer ];
    [ self->__imageLayer__pureWiki removeFromSuperlayer ];
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
