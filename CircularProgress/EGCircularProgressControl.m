//
//  EGCircularProgressControl.m
//  CircularProgress
//
//  Created by Emma on 15/02/2014.
//  Copyright (c) 2014 Emma Guy. All rights reserved.
//

#import "EGCircularProgressControl.h"

@interface EGCircularProgressControl()

@property (nonatomic, strong) CAShapeLayer* progressShapeLayer;
@property (nonatomic, strong) CAShapeLayer* backgroundShapeLayer;

@property (nonatomic, readonly) CGFloat radius;
@property (nonatomic, readonly) CGPoint boundsCenter;

@end

@implementation EGCircularProgressControl

#pragma mark lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
  
    [self setUpView];
}

- (void)setUpView
{
    CGFloat startAngle = M_PI * 1.5;
    CGFloat endAngle = startAngle + (M_PI * 2);
    
    UIBezierPath *processPath = [UIBezierPath bezierPath];
    [processPath addArcWithCenter:self.boundsCenter
                           radius:self.radius
                       startAngle:startAngle
                         endAngle:endAngle
                        clockwise:YES];

    self.backgroundShapeLayer.path = [processPath CGPath];
    self.progressShapeLayer.path = [processPath CGPath];
    
    NSLog(@"frame.origin: %@", NSStringFromCGPoint(self.frame.origin));
    NSLog(@"frame.size: %@", NSStringFromCGSize(self.frame.size));
    NSLog(@"self.bounds: %@", NSStringFromCGRect(self.bounds));
    NSLog(@"self.radius: %f", self.radius);
    NSLog(@"self.boundsCenter: %@", NSStringFromCGPoint(self.boundsCenter));
}

#pragma mark get properties

- (CGPoint)boundsCenter
{
    return CGPointMake((self.bounds.size.width ) / 2.0, (self.bounds.size.height ) / 2.0);
}

- (CGFloat)radius
{
    return (self.bounds.size.width / 2.0) - 4.0f;
}

- (CAShapeLayer *)progressShapeLayer
{
    if (_progressShapeLayer == nil) {
        _progressShapeLayer = [CAShapeLayer layer];
        _progressShapeLayer.fillColor = [[UIColor clearColor] CGColor];
        _progressShapeLayer.lineWidth = 5.0;
        _progressShapeLayer.strokeStart = 0.0;
        _progressShapeLayer.contentsScale = [[UIScreen mainScreen] scale];
        [self.layer addSublayer:_progressShapeLayer];
    }
    
    return _progressShapeLayer;
}

- (CAShapeLayer *)backgroundShapeLayer
{
    if (_backgroundShapeLayer == nil) {
        _backgroundShapeLayer = [CAShapeLayer layer];
        _backgroundShapeLayer.fillColor = [[UIColor clearColor] CGColor];
        _backgroundShapeLayer.strokeColor = [[UIColor whiteColor] CGColor];
        _backgroundShapeLayer.lineWidth = 5.0;
        _backgroundShapeLayer.strokeStart = 0.0;
        _backgroundShapeLayer.contentsScale = [[UIScreen mainScreen] scale];
        
        [self.layer addSublayer:_backgroundShapeLayer];
    }
    
    return _backgroundShapeLayer;
}

#pragma mark set properties

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:YES];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    if(isnan(progress) || progress < 0) return;
    
    _progress = progress;
    
    if(!animated) {
        [CATransaction setDisableActions:YES];
    }
    
    self.progressShapeLayer.strokeColor = [self.progressColour CGColor];
    self.progressShapeLayer.strokeEnd = _progress;
}

@end
