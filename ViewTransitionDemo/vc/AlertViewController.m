//
//  AlertViewController.m
//  ViewTransitionDemo
//
//  Created by sunxuiMac on 2018/11/10.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
}
- (IBAction)ckDismiss:(id)sender {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
