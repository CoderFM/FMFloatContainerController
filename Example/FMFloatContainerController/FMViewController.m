//
//  FMViewController.m
//  FMFloatContainerController
//
//  Created by zhoufaming251@163.com on 11/28/2022.
//  Copyright (c) 2022 zhoufaming251@163.com. All rights reserved.
//

#import "FMViewController.h"
#import <FMFloatContainerController.h>

@interface FMViewController ()

@end

@implementation FMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    FMFloatShowScaleConfig *config = [FMFloatShowScaleConfig defaultConfig];
    config.contentSize = CGSizeMake(200, 100);
    config.centerOffset = CGPointMake(0, -100);
    [FMFloatContainerController showWithInViewController:self contentViewController:vc config:config completion:^{
        
    }];
}

@end
