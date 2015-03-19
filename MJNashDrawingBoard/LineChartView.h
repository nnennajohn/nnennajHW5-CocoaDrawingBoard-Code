//
//  PCELineChartView.h
//  DrawingBoard
//
//  Created by Martin Nash on 7/28/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface LineChartView : NSView
-(void)redrawForNumbers:(NSArray*)numbers;
@end
