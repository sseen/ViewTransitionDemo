//
//  ViewController.m
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/10/29.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "ViewController.h"
#import "AnotherViewController.h"

@interface ViewController ()

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

@end
