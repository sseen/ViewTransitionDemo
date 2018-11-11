//
//  ViewController.m
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/10/29.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"
#import "TweetBotDismissingAnimator.h"
#import "TweetBotPresentingAnimator.h"
#import "ThirdViewController.h"
#import "AlertPresentingAnimator.h"
#import "AlertDismissngAnimator.h"
#import "AlertViewController.h"

@interface ViewController ()< UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)ckPush:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AnotherViewController *modalViewController = [storyBoard instantiateViewControllerWithIdentifier:@"vc"];
    
    [self.navigationController pushViewController:modalViewController animated:YES];
}

#pragma mark - UIViewControllerTransitioningDelegate
    
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
    {
        return [TweetBotPresentingAnimator new];
    }
    
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
    {
        return [TweetBotDismissingAnimator new];
}

- (IBAction)ckCenterShow:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AlertViewController *modalViewController = [storyBoard instantiateViewControllerWithIdentifier:@"AlertViewController"];
//    modalViewController.handler = ^{
//        // [self.navigationController pushViewController:modalViewController animated:true];
//    };
    
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:modalViewController animated:YES completion:nil];
    
}


@end
