//
//  FMFloatShowBaseConfig.h
//  FMFloatContainerController
//
//  Created by iOS on 2022/11/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMFloatShowBaseConfig : NSObject

@property(nonatomic, assign)NSTimeInterval animationDuration;
@property(nonatomic, assign)NSTimeInterval animationDelay;
@property(nonatomic, assign)UIViewAnimationOptions animationOptions;
@property(nonatomic, assign)CGFloat animationDamping;
@property(nonatomic, assign)CGFloat animationVelocity;
@property(nonatomic, assign)CGFloat damingColorAlpha;
@property(nonatomic, assign)BOOL damingTapCanDismiss;
@property(nonatomic, assign)BOOL dismissNotAnimation;

@property(nonatomic, assign)CGAffineTransform transform;

+ (instancetype)defaultConfig;

- (void)layoutContainerView:(UIView *)containerView;

@end

NS_ASSUME_NONNULL_END
