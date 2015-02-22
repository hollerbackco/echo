
//
//  DismissSegue.m
//  WinWin
//
//  Created by Will Dennis on 10/30/14.
//  Copyright (c) 2014 Will Dennis. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end