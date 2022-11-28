//
//  FMFloatContainerController.h
//  FMBaseiOSKit_Example
//
//  Created by 郑桂华 on 2022/4/16.
//  Copyright © 2022 zhoufaming251@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMFloatShowTranslateConfig.h"
#import "FMFloatShowScaleConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMFloatContainerController : UIViewController

@property(nonatomic, weak)UIView *containerView;
@property(nonatomic, weak)UIViewController *contentViewController;
@property(nonatomic, copy)void(^showCompletion)(void);
@property(nonatomic, copy)void(^hideCompletion)(void);

+ (instancetype)showWithInViewController:(UIViewController *)viewController contentViewController:(UIViewController *)contentViewController config:(FMFloatShowBaseConfig *)config completion:(void (^)(void))completion;

- (void)dismissWithCompletion:(void (^)(void))completion;

@end

@interface UIViewController (FMFloat)

- (FMFloatContainerController * __nullable)floatContainerController;

@end

NS_ASSUME_NONNULL_END
