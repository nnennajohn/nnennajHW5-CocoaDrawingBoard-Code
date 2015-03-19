//
//  StockViewController.m
//  DrawingBoard
//
//  Created by Martin Nash on 7/28/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

#import "StockViewController.h"
#import "LineChartView.h"
#import "RandomPercentGenerator.h"

@interface StockViewController ()
@property (strong, nonatomic) IBOutlet LineChartView *lineChartView;
@end

@implementation StockViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self refresh:nil];
}

- (IBAction)refresh:(id)sender
{
    NSArray *percents = [RandomPercentGenerator arrayOfPercents:10];
    [self.lineChartView redrawForNumbers:percents];
}

@end
