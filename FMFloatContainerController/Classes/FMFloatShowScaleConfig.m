//
//  FMFloatShowScaleConfig.m
//  FMFloatContainerController
//
//  Created by iOS on 2022/11/28.
//

#import "FMFloatShowScaleConfig.h"

@implementation FMFloatShowScaleConfig

- (void)layoutContainerView:(UIView *)containerView{
    [NSLayoutConstraint activateConstraints:@[
        [containerView.centerXAnchor constraintEqualToAnchor:containerView.superview.centerXAnchor constant:self.centerOffset.x],
        [containerView.centerYAnchor constraintEqualToAnchor:containerView.superview.centerYAnchor constant:self.centerOffset.y],
        [containerView.heightAnchor constraintEqualToConstant:self.contentSize.height],
        [containerView.widthAnchor constraintEqualToConstant:self.contentSize.width]
    ]];
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
}

@end
