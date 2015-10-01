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
    {
    if ( self = [ super init ] )
        {
        self->__image = _Image;
        [ self setContents: [ self->__image layerContentsForContentsScale: 2.f ] ];

        [ self setNeedsDisplay ];
        }

    return self;
    }

@end
