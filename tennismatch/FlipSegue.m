
//
//  FlipSegue.m
//  tennismatch
//
//  Created by Christopher Farm on 10/13/13.
//  Copyright (c) 2013 com.ordinance. All rights reserved.
//

#import "FlipSegue.h"

@implementation FlipSegue

-(void) perform
{
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];    
}

@end
