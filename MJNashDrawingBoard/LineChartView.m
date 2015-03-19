//
//  PCELineChartView.m
//  DrawingBoard
//
//  Created by Martin Nash on 7/28/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

#import "LineChartView.h"

@interface LineChartView ()
@property (copy, nonatomic) NSArray *numbers;
@end

@implementation LineChartView

-(void)redrawForNumbers:(NSArray*)numbers
{
    self.numbers = numbers;
    [self setNeedsDisplay:YES];
}

-(BOOL)isFlipped {
    return NO;
}

-(void)prepareForInterfaceBuilder
{
    self.numbers = @[];
    for (int i = 0; i<10; i++) {
        self.numbers = [self.numbers arrayByAddingObject: @(drand48())];
    }
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];

    // background
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:dirtyRect];
    
    // border
    [[NSColor greenColor] set];
    [NSBezierPath strokeRect: dirtyRect];
    

    // helpful numbers
    CGFloat width  = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat segmentWidth = width / (self.numbers.count + 1);
    
    NSBezierPath *linePath = [NSBezierPath bezierPath];
    CGPoint startPt = CGPointZero;
    [linePath moveToPoint:startPt];

    // add points to line
    [self.numbers enumerateObjectsUsingBlock:^(NSNumber *value, NSUInteger idx, BOOL *stop) {
        CGPoint point = CGPointMake(segmentWidth * (idx+1), height * value.floatValue);
        [linePath lineToPoint:point];
    }];
    
    
    [linePath lineToPoint: CGPointMake(self.bounds.size.width, 0)];


    [[NSColor colorWithPatternImage:[NSImage imageNamed:@"blue-plaid-pattern"]] set];
    [linePath fill];
    
    [[NSColor blackColor] set];
    [linePath stroke];
}

@end
