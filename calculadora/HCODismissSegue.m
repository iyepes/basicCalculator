//
//  HCODismissSegue.m
//  calculadora
//
//  Created by Isabel Yepes on 21/02/15.
//  Copyright (c) 2015 Isabel Yepes. All rights reserved.
//

#import "HCODismissSegue.h"

@implementation HCODismissSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
