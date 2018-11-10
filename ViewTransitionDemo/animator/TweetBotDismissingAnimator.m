//
//  TweetBotDismissingAnimator.m
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/11/9.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "TweetBotDismissingAnimator.h"
#import <pop/POP.h>

@implementation TweetBotDismissingAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toVC.view.userInteractionEnabled = YES;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    __block UIView *dimmingView;
    [transitionContext.containerView.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if (view.layer.opacity < 1.f) {
            dimmingView = view;
            *stop = YES;
        }
    }];
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.0);
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    POPBasicAnimation *offscreenAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    offscreenAnimation.duration = 2;
    offscreenAnimation.beginTime = CACurrentMediaTime() + 0.3;
    offscreenAnimation.fromValue = @(fromVC.view.frame.origin.y + fromVC.view.frame.size.height);
    offscreenAnimation.toValue = @(window.bounds.size.height + fromVC.view.frame.size.height);
    
    
    POPBasicAnimation *rotationAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    [rotationAnim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    // 旋转
    rotationAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    rotationAnim.fromValue = @(0);
    rotationAnim.beginTime = CACurrentMediaTime();// + 0.1; // 延迟 0.1s
    rotationAnim.duration = 1;
    rotationAnim.toValue = @(-M_PI);
    CGRect fromRect = fromVC.view.frame;
    fromVC.view.layer.anchorPoint = CGPointMake(1, 1);
    CGRect fromRectAnchor = fromVC.view.frame;
    fromRectAnchor = fromRect;
    fromVC.view.frame = fromRectAnchor;
    
    [fromVC.view.layer pop_addAnimation:rotationAnim forKey:@"rotationAnimation"];
    [fromVC.view.layer pop_addAnimation:offscreenAnimation forKey:@"offscreenAnimation"];
    [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end
