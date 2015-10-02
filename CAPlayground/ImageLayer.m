//
//  ImageLayer.m
//  CAPlayground
//
//  Created by Tong G. on 10/2/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

#import "ImageLayer.h"

@implementation ImageLayer

- ( void ) display
    {
    NSLog( @"Redrawing…" );
    [ self setContents: self->__image ];
    }

- ( instancetype ) initWithImage: ( NSImage* )_Image
                           frame: ( NSRect )_Frame
    {
    if ( self = [ super init ] )
        {
        self->__image = _Image;
        [ self setContents: [ self->__image layerContentsForContentsScale: 2.f ] ];

        [ self setNeedsDisplay ];
        [ self setName: _Image.name ];
//        [ self setContentsGravity: kCAGravityResizeAspect ];

        [ self setAnchorPoint: NSMakePoint( 0.f, 0.f ) ];
        [ self setPosition: _Frame.origin ];
        [ self setBounds: NSMakeRect( 0.f, 0.f, NSWidth( _Frame ), NSHeight( _Frame ) ) ];
        }

    return self;
    }

@end
