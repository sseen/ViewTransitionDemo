//
//  ThirdViewController.h
//  ViewTransitionDemo
//
//  Created by Jasmine on 2018/10/29.
//  Copyright © 2018 Jasmine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController
@property (nonatomic, strong, nullable) void (^handler)(void);
@end

NS_ASSUME_NONNULL_END
