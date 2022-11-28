//
//  FMFloatShowBaseConfig.m
//  FMFloatContainerController
//
//  Created by iOS on 2022/11/28.
//

#import "FMFloatShowBaseConfig.h"

@implementation FMFloatShowBaseConfig

+ (instancetype)defaultConfig{
    FMFloatShowBaseConfig *config = [[self alloc] init];
    config.animationDuration = 0.25;
    config.animationOptions = UIViewAnimationOptionCurveLinear;
    config.animationDelay = 0;
    config.animationDamping = 1;
    config.animationVelocity = 0;
    config.damingColorAlpha = 0.5;
    config.damingTapCanDismiss = YES;
    config.transform = CGAffineTransformIdentity;
    config.dismissNotAnimation = YES;
    return config;
}

- (void)layoutContainerView:(UIView *)containerView{
    [NSLayoutConstraint activateConstraints:@[
        [containerView.leftAnchor constraintEqualToAnchor:containerView.superview.leftAnchor constant:0],
        [containerView.rightAnchor constraintEqualToAnchor:containerView.superview.rightAnchor constant:0],
        [containerView.bottomAnchor constraintEqualToAnchor:containerView.superview.bottomAnchor constant:0],
        [containerView.topAnchor constraintEqualToAnchor:containerView.superview.topAnchor constant:0]
    ]];
}

@end
