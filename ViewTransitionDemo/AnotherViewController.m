//
//  AnotherViewController.m
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/10/29.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "AnotherViewController.h"
#import "AlertPresentingAnimator.h"
#import "AlertDismissngAnimator.h"
#import "ThirdViewController.h"

@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [AlertPresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [AlertDismissngAnimator new];
}

- (IBAction)ckModal:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdViewController *modalViewController = [storyBoard instantiateViewControllerWithIdentifier:@"vc2"];
    modalViewController.handler = ^{
        // [self.navigationController pushViewController:modalViewController animated:true];
    };
    
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:modalViewController animated:YES completion:nil];
    
}

@end
