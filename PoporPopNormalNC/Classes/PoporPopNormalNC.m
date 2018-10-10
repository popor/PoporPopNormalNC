//
//  PoporPopNormalNC.m
//  popor
//
//  Created by popor on 2017/4/25.
//  Copyright © 2017年 popor. All rights reserved.
//

#import "PoporPopNormalNC.h"

#import <PoporUI/UIViewController+ncBar.h>

@interface PoporPopNormalNC () <UINavigationControllerDelegate>

@end

@implementation PoporPopNormalNC

#pragma mark - 初始化
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController updateBarBackTitle:(BOOL)updateBarBackTitle barBackTitle:(NSString *)barBackTitle {
    PoporPopNormalNC * nc = [super initWithRootViewController:rootViewController];
    nc.updateBarBackTitle = updateBarBackTitle;
    nc.barBackTitle       = barBackTitle;
    
    if (nc.isUpdateBarBackTitle) {
        rootViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nc.barBackTitle style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    
    return nc;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    PoporPopNormalNC * nc = [super initWithRootViewController:rootViewController];
    
    return nc;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    PoporPopNormalNC * nc = [super initWithCoder:aDecoder];
    
    return nc;
}

- (instancetype)init {
    PoporPopNormalNC * nc = [super init];
    
    return nc;
}

#pragma mark - 设置
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.delegate                  = self;
    
    [self setInteractivePopGRDelegate];
}

- (void)setBarTitleColorStyleBlock:(void (^)(void))barTitleColorStyleBlock {
    barTitleColorStyleBlock();
}

- (void)setBarBackImage:(UIImage *)barBackImage{
    self.navigationBar.backIndicatorImage               = barBackImage;
    self.navigationBar.backIndicatorTransitionMaskImage = barBackImage;
}

- (void)setInteractivePopGRDelegate {
    self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

// 是否隐藏状态栏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [navigationController setNavigationBarHidden:viewController.hiddenNcBar animated:YES];
}

// 设置返回按钮title
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.isUpdateBarBackTitle) {
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.barBackTitle style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    if (self.forbiddenPushSameViewController && [self.topViewController isMemberOfClass:[viewController class]]) {
        // 禁止push相同的vc
        NSLog(@"PoporPopNormalNC: forbidden Push Same ViewController.");
    }else{
        if (self.autoHidesBottomBarWhenPushed) {
            if (self.viewControllers.count > 0) {
                viewController.hidesBottomBarWhenPushed = YES;
            }
        }
        [super pushViewController:viewController animated:animated];
    }
}

@end
