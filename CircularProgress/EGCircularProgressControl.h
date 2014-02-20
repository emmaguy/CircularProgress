//
//  EGCircularProgressControl.h
//  CircularProgress
//
//  Created by Emma on 15/02/2014.
//  Copyright (c) 2014 Emma Guy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EGCircularProgressControlDelegate <NSObject>

- (void)userUpdatedProgress:(CGFloat)progress;

@end

@interface EGCircularProgressControl : UIControl

@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) UIColor *progressColour;

@property (nonatomic, assign) IBOutlet id <EGCircularProgressControlDelegate> delegate;

@end
