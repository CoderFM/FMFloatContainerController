//
//  FMFloatShowTranslateConfig.m
//  FMFloatContainerController
//
//  Created by iOS on 2022/11/28.
//

#import "FMFloatShowTranslateConfig.h"

@implementation FMFloatShowTranslateConfig

+ (instancetype)defaultConfig{
    FMFloatShowTranslateConfig *config = [super defaultConfig];
    config.from = FMFloatShowTranslateFromBottom;
    config.contentInsets = UIEdgeInsetsMake(0, 10, 20, 10);
    config.contentSize = 200;
    config.dismissNotAnimation = NO;
    return config;
}

- (void)layoutContainerView:(UIView *)containerView{
    switch (self.from) {
        case FMFloatShowTranslateFromBottom:
        {
            [NSLayoutConstraint activateConstraints:@[
                [containerView.leftAnchor constraintEqualToAnchor:containerView.superview.leftAnchor constant:self.contentInsets.left],
                [containerView.rightAnchor constraintEqualToAnchor:containerView.superview.rightAnchor constant:-self.contentInsets.right],
                [containerView.bottomAnchor constraintEqualToAnchor:containerView.superview.bottomAnchor constant:-self.contentInsets.bottom],
                [containerView.heightAnchor constraintEqualToConstant:self.contentSize]
            ]];
            self.transform = CGAffineTransformMakeTranslation(0, self.contentSize + self.contentInsets.bottom);
        }
            break;
        case FMFloatShowTranslateFromTop:
        {
            [NSLayoutConstraint activateConstraints:@[
                [containerView.leftAnchor constraintEqualToAnchor:containerView.superview.leftAnchor constant:self.contentInsets.left],
                [containerView.rightAnchor constraintEqualToAnchor:containerView.superview.rightAnchor constant:-self.contentInsets.right],
                [containerView.topAnchor constraintEqualToAnchor:containerView.superview.topAnchor constant:self.contentInsets.top],
                [containerView.heightAnchor constraintEqualToConstant:self.contentSize]
            ]];
            self.transform = CGAffineTransformMakeTranslation(0, -(self.contentSize + self.contentInsets.top));
        }
            break;
        case FMFloatShowTranslateFromLeft:
        {
            [NSLayoutConstraint activateConstraints:@[
                [containerView.leftAnchor constraintEqualToAnchor:containerView.superview.leftAnchor constant:self.contentInsets.left],
                [containerView.topAnchor constraintEqualToAnchor:containerView.superview.topAnchor constant:self.contentInsets.top],
                [containerView.bottomAnchor constraintEqualToAnchor:containerView.superview.bottomAnchor constant:-self.contentInsets.bottom],
                [containerView.widthAnchor constraintEqualToConstant:self.contentSize]
            ]];
            self.transform = CGAffineTransformMakeTranslation(-(self.contentSize + self.contentInsets.left), 0);
        }
            break;
        case FMFloatShowTranslateFromRight:
        {
            [NSLayoutConstraint activateConstraints:@[
                [containerView.topAnchor constraintEqualToAnchor:containerView.superview.topAnchor constant:self.contentInsets.top],
                [containerView.rightAnchor constraintEqualToAnchor:containerView.superview.rightAnchor constant:-self.contentInsets.right],
                [containerView.bottomAnchor constraintEqualToAnchor:containerView.superview.bottomAnchor constant:-self.contentInsets.bottom],
                [containerView.heightAnchor constraintEqualToConstant:self.contentSize]
            ]];
            self.transform = CGAffineTransformMakeTranslation((self.contentSize + self.contentInsets.right), 0);
        }
            break;
        default:
            break;
    }
}


@end
