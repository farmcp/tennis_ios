//
//  BottomUpSegue.m
//  tennismatch
//
//  Created by Christopher Farm on 11/5/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "BottomUpSegue.h"

@implementation BottomUpSegue
- (void) perform{
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}
@end
