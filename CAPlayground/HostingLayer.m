//
//  HostingLayer.m
//  CAPlayground
//
//  Created by Tong G. on 9/30/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "HostingLayer.h"

@implementation HostingLayer

- ( instancetype ) init
    {
    if ( self = [ super init ] )
        {
        self.contentsScale = 2.f;
        self.contentsGravity = kCAGravityResizeAspectFill;

        self.shadowColor = [ NSColor blackColor ].CGColor;
        self.shadowOffset = CGSizeMake( 2.f, -3.f );
        self.shadowOpacity = .5f;
        }

    return self;
    }

#if 1
- ( void ) display
    {
    NSLog( @"Redrawing…" );
    NSImage* image = [ NSImage imageNamed: @"purewiki" ];
    [ self setContents: [ image layerContentsForContentsScale: 2.f ] ];
    }
#endif

#if 0
- ( void ) drawInContext: ( CGContextRef )_Ctx
    {
    CGMutablePathRef cgPath = CGPathCreateMutable();

    CGPathMoveToPoint( cgPath, NULL, 15.f, 15.f );
    CGPathMoveToPoint( cgPath, NULL, 15.f, 15.f );
    CGPathAddCurveToPoint( cgPath
                         , NULL
                         , 15.f, 250.0f
                         , 295.0f, 250.0f
                         , 295.0f, 15.0f
                         );

    CGContextBeginPath( _Ctx );
    CGContextAddPath( _Ctx, cgPath );
 
    CGContextSetLineWidth( _Ctx, 5 );
    CGContextStrokePath( _Ctx );

    CFRelease( cgPath );
    }
#endif

@end
