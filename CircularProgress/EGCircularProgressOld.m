//
//  EGCircularProgressOld.m
//  CircularProgress
//
//  Created by Emma on 18/02/2014.
//  Copyright (c) 2014 Emma Guy. All rights reserved.
//

#import "EGCircularProgressOld.h"

@interface EGCircularProgressOld ()
@property (nonatomic) CGFloat startAngle;
@property (nonatomic) CGFloat endAngle;
@property (nonatomic) CGFloat percent;

@property (nonatomic) float radius;
@end

@implementation EGCircularProgressOld

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initalization];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initalization];
}

- (void)initalization {
    // Determine our start and stop angles for the arc (in radians)
    self.startAngle = M_PI * 1.5;
    self.endAngle = self.startAngle + (M_PI * 2);
}

- (void)drawRect:(CGRect)rect {
    self.percent = 0.25f;
    
    UIBezierPath *backCircle = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [backCircle addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:(rect.size.width/2.0f) - 4.0f
                      startAngle:(self.endAngle - self.startAngle) * _percent + self.startAngle
                        endAngle:self.endAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    backCircle.lineWidth = 5;
    [[UIColor whiteColor] setStroke];
    [backCircle stroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:(rect.size.width/2.0f) - 4.0f
                      startAngle:self.startAngle
                        endAngle:(self.endAngle - self.startAngle) * _percent + self.startAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 5;
    [[UIColor purpleColor] setStroke];
    [bezierPath stroke];
}

@end