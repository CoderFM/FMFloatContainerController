//
//  FMFloatContainerController.m
//  FMBaseiOSKit_Example
//
//  Created by 郑桂华 on 2022/4/16.
//  Copyright © 2022 zhoufaming251@163.com. All rights reserved.
//

#import "FMFloatContainerController.h"


@interface FMFloatContainerController ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property(nonatomic, strong)FMFloatShowBaseConfig *config;
@property(nonatomic, assign)BOOL isClose;

@end

@implementation FMFloatContainerController

+ (instancetype)showWithInViewController:(UIViewController *)viewController contentViewController:(UIViewController *)contentViewController config:(FMFloatShowBaseConfig *)config completion:(void (^)(void))completion{
    FMFloatContainerController *containerVC = [[FMFloatContainerController alloc] init];
    containerVC.config = config;
    containerVC.showCompletion = completion;
    containerVC.modalPresentationStyle = UIModalPresentationCustom;
    containerVC.transitioningDelegate = containerVC;
    [containerVC addChildViewController:contentViewController];
    containerVC.contentViewController = contentViewController;
    [viewController presentViewController:containerVC animated:NO completion:nil];
    return containerVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    UIView *containerView = [[UIView alloc] init];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    containerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:containerView];
    [self.config layoutContainerView:containerView];
    [containerView layoutIfNeeded];
    containerView.transform = self.config.transform;
    self.containerView = containerView;
    [containerView addSubview:self.contentViewController.view];
    self.contentViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.contentViewController.view.leftAnchor constraintEqualToAnchor:containerView.leftAnchor],
        [self.contentViewController.view.rightAnchor constraintEqualToAnchor:containerView.rightAnchor],
        [self.contentViewController.view.topAnchor constraintEqualToAnchor:containerView.topAnchor],
        [self.contentViewController.view.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor]
    ]];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:self.config.animationDuration delay:self.config.animationDelay usingSpringWithDamping:self.config.animationDamping initialSpringVelocity:self.config.animationVelocity options:self.config.animationOptions animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:self.config.damingColorAlpha];
        self.containerView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        !self.showCompletion?:self.showCompletion();
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.config.damingTapCanDismiss) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.view];
        if (!CGRectContainsPoint(self.containerView.frame, point)) {
            [self dismissWithCompletion:^{
                
            }];
        }
    }
}

- (void)dismissWithCompletion:(void (^)(void))completion{
    if (!self.config.dismissNotAnimation) {
        [UIView animateWithDuration:self.config.animationDuration animations:^{
            self.view.backgroundColor = [UIColor clearColor];
            self.containerView.transform = self.config.transform;
        } completion:^(BOOL finished) {
            !self.hideCompletion?:self.hideCompletion();
            [self dismissViewControllerAnimated:NO completion:completion];
        }];
    } else {
        !self.hideCompletion?:self.hideCompletion();
        [self dismissViewControllerAnimated:NO completion:completion];
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.isClose = NO;
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isClose = YES;
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.config.animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    if (self.isClose) {
        if (![containerView.subviews containsObject:toView]) {
            [containerView insertSubview:toView belowSubview:fromView];
        }
        [UIView animateWithDuration:duration animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
        }];
    } else {
        toView.alpha = 0;
        [containerView addSubview:toView];
        [UIView animateWithDuration:duration animations:^{
            toView.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }
}

@end

@implementation UIViewController (FMFloat)

- (FMFloatContainerController *)floatContainerController{
    if ([self.parentViewController isKindOfClass:[FMFloatContainerController class]]) {
        return (FMFloatContainerController *)self.parentViewController;
    }
    return nil;
}

@end
