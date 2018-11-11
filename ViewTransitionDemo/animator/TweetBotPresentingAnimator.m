//
//  TweetBotPresentingAnimator.m
//  ViewTransitionDemo
//
//  Created by sunxuiMac on 2018/11/8.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "TweetBotPresentingAnimator.h"
#import <pop/POP.h>

@implementation TweetBotPresentingAnimator

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *dimmingView = [[UIView alloc] initWithFrame:fromView.bounds];
    dimmingView.backgroundColor =   [UIColor colorWithWhite:0 alpha:0.5];
    dimmingView.layer.opacity = 0.0;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              248,
                              //CGRectGetWidth(transitionContext.containerView.bounds) - 24.f,
                              170);
    toView.center = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y);
    fromView.center = toView.center;
    toView.layer.cornerRadius = 8;
    
    [transitionContext.containerView addSubview:dimmingView];
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(transitionContext.containerView.center.y - 80);
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.5);
    [opacityAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPBasicAnimation *opacityAnimationNotDim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimationNotDim.fromValue = @(0);
    opacityAnimationNotDim.toValue = @(1);
    [opacityAnimationNotDim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        
    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 10;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.2)];
    scaleAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        // [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    };
    
//    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:opacityAnimationNotDim forKey:@"opacityAnimationNotDim"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
}
    
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
    
    @end
