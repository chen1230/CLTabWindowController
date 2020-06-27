//
//  NSImage+SVGCategory.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/25.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "NSImage+SVGCategory.h"
#import <SVGKit/SVGKit.h>
#import <SVGKit/SVGKImage+CGContext.h>
#import <SVGKit/SVGKExporterNSImage.h>


@implementation NSImage (SVGCategory)

+ (NSImage *)svgImageNamed:(NSString *)name size:(CGSize)size {
    SVGKImage *svgImage = [SVGKImage imageNamed:name];
    svgImage.size = size;
    return svgImage.NSImage;
}

+ (NSImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor{
    
    return [self svgNamed:svgNamed cgColor:cgColor identifier:nil];
}

+ (NSImage *)svgNamed:(NSString *)svgNamed cgColor:(CGColorRef)cgColor identifier:(NSString *)identifier{
    SVGKImage * svgImage = [SVGKImage imageNamed:svgNamed];
    if (identifier.length>0) {
        CALayer * layer = [svgImage layerWithIdentifier:identifier];
           if( [layer isKindOfClass:[CAShapeLayerWithHitTest class]]){
               CAShapeLayerWithHitTest* shapeLayer = (CAShapeLayerWithHitTest *)layer;
               shapeLayer.fillColor = cgColor;
           }
    }

    SVGKLayeredImageView * icon = [[SVGKLayeredImageView alloc] initWithSVGKImage:svgImage];
    icon.wantsLayer = YES;
    icon.layer.backgroundColor = [NSColor clearColor].CGColor;
    return icon.image.NSImage;
}


+ (CGImageRef)nsImageToCGImageRef:(NSImage*)image;
{
    NSData * imageData = [image TIFFRepresentation];
    CGImageRef imageRef;
    if(imageData)
    {
        CGImageSourceRef imageSource =
                  CGImageSourceCreateWithData(
                            (CFDataRef)imageData,  NULL);
 
        imageRef = CGImageSourceCreateImageAtIndex(
                               imageSource, 0, NULL);
    }

    return imageRef;
}


@end
