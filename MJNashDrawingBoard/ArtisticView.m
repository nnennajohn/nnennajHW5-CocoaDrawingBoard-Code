//
//  ArtisticView.m
//  DrawingBoard
//
//  Created by Martin Nash on 7/29/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

#import "ArtisticView.h"

@implementation ArtisticView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    [[NSColor whiteColor] set];
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat hegiht = CGRectGetHeight(self.bounds);
    
    for (int i = 0; i < 200; i++) {

        CGPoint point = CGPointMake(arc4random_uniform(width), arc4random_uniform(hegiht));
        CGSize size = CGSizeMake(arc4random_uniform(200), arc4random_uniform(200));
        CGRect rect = (CGRect){.size = size, .origin = point};

        [[self randomColorWithAlpha:0.8] set];
        NSBezierPath *path = [NSBezierPath bezierPathWithRect:rect];
        [path fill];
    }
}

// This belongs in a category on NSColor
-(NSColor*)randomColorWithAlpha:(CGFloat)alpha
{
    return [NSColor colorWithRed:arc4random_uniform(255.0) / 255.0
                           green:arc4random_uniform(255.0) / 255.0
                            blue:arc4random_uniform(255.0) / 255.0
                           alpha:alpha];
}

@end
