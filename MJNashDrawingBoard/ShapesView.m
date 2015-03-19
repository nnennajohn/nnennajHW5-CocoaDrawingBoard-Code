//
//  PCEShapesView.m
//  DrawingBoard
//
//  Created by Martin Nash on 7/29/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

#import "ShapesView.h"

@implementation ShapesView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];

    CGFloat padding = 20;
    CGFloat width  = CGRectGetWidth(self.bounds);
    CGFloat totalPadding = padding * 4;
    CGFloat totalShapeWidth = width - totalPadding;
    CGFloat shapeWidth = totalShapeWidth / 3.0;
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:dirtyRect];
    
    [[NSColor greenColor] set];
    NSBezierPath *squarePath = [NSBezierPath bezierPath];
    [squarePath moveToPoint:CGPointMake(padding, padding)];
    [squarePath relativeLineToPoint:CGPointMake(0, shapeWidth)];
    [squarePath relativeLineToPoint:CGPointMake(shapeWidth, 0)];
    [squarePath relativeLineToPoint:CGPointMake(0, -shapeWidth)];
    [squarePath relativeLineToPoint:CGPointMake(-shapeWidth, 0)];
    [squarePath closePath];
    [squarePath fill];
    
    
    CGFloat base = shapeWidth;
    NSBezierPath *trianglePath = [NSBezierPath bezierPath];
    [trianglePath moveToPoint:squarePath.currentPoint];
    [trianglePath relativeMoveToPoint:CGPointMake(shapeWidth + padding, 0)];
    [trianglePath relativeLineToPoint:CGPointMake(base*0.5, base)];
    [trianglePath relativeLineToPoint:CGPointMake(base*0.5, -base)];
    [trianglePath relativeLineToPoint:CGPointMake(-base, 0)];
    [trianglePath closePath];
    [trianglePath fill];
    
  
    CGRect circleRect = CGRectMake(padding, padding, shapeWidth, shapeWidth);
    circleRect = CGRectOffset(circleRect, CGRectGetMaxX(trianglePath.controlPointBounds), 0);
    NSBezierPath *bezierPath = [NSBezierPath bezierPathWithOvalInRect:circleRect];
    [bezierPath closePath];
    [bezierPath fill];
}

@end
