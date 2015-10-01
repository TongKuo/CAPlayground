//
//  ImageLayer.h
//  CAPlayground
//
//  Created by Tong G. on 10/2/15.
//  Copyright © 2015 Tong Kuo. All rights reserved.
//

@import QuartzCore;

@interface ImageLayer : CALayer
    {
@private
    NSImage __strong* __image;
    }

- ( instancetype ) initWithImage: ( NSImage* )_Image;

@end
