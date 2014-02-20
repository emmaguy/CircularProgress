//
//  EGCircularProgressViewController.m
//  CircularProgress
//
//  Created by Emma on 15/02/2014.
//  Copyright (c) 2014 Emma Guy. All rights reserved.
//

#import "EGCircularProgressViewController.h"

#import "EGCircularProgressOld.h"

@interface EGCircularProgressViewController ()

@property (nonatomic, weak) IBOutlet EGCircularProgressControl *circularProgressControl;
@property (weak, nonatomic) IBOutlet EGCircularProgressOld *old;

@end


@implementation EGCircularProgressViewController

#pragma mark lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.circularProgressControl setProgressColour:[UIColor purpleColor]];
    [self.circularProgressControl setDelegate:self];
    [self.circularProgressControl setProgress:0.25f];
}

#pragma mark EGCircularProgressControlDelegate

- (void)userUpdatedProgress:(CGFloat)progress
{
    NSLog(@"progress: %f", progress);
}

@end
