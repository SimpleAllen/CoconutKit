//
//  HLSSPushSegue.m
//  CoconutKit
//
//  Created by Samuel Défago on 27.06.12.
//  Copyright (c) 2012 Samuel Défago. All rights reserved.
//

#import "HLSStackPushSegue.h"

#import "HLSLogger.h"
#import "HLSStackController.h"

NSString * const HLSStackRootSegueIdentifier = @"hls_root";

@implementation HLSStackPushSegue

#pragma mark Object creation and destruction

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    if ((self = [super initWithIdentifier:identifier source:source destination:destination])) {
        self.transitionClass = [HLSTransitionNone class];
        self.duration = kAnimationTransitionDefaultDuration;
        self.animated = YES;
    }
    return self;
}

#pragma mark Overrides

- (void)perform
{
    HLSStackController *stackController = nil;
    
    // The source is a stack controller. The 'hls_root' segue is used to set its root view controller
    if ([self.sourceViewController isKindOfClass:[HLSStackController class]]) {
        stackController = self.sourceViewController;
        if (! [self.identifier isEqualToString:HLSStackRootSegueIdentifier]) {
            HLSLoggerError(@"The push segue attached to a stack controller must be called '%@'", HLSStackRootSegueIdentifier);
            return;
        }
        
        if ([[stackController viewControllers] count] != 0) {
            HLSLoggerError(@"The segue called '%@' can only be used to set a root view controller. No view controller "
                           "must have been loaded before", HLSStackRootSegueIdentifier);
            return;
        }
    }
    // The source is an arbitrary view controller. Check that it is embedded into a stack controller, and
    // push the destination view controller into it
    else {
        UIViewController *sourceViewController = self.sourceViewController;
        if (! sourceViewController.stackController) {
            HLSLoggerError(@"The source view controller is not embedded into a stack controller");
            return;
        }
        
        stackController = sourceViewController.stackController;
    }
    
    [stackController pushViewController:self.destinationViewController
                    withTransitionClass:self.transitionClass
                               duration:self.duration
                               animated:self.animated];
}

@end

@implementation UIViewController (HLSStackControllerSegueUnwinding)

- (IBAction)unwindToPreviousViewControllerInStackControllerAnimated:(UIStoryboardSegue *)sender
{
    NSAssert(self.stackController, @"The view controller must be contained within a stack controller");
    [self.stackController popViewControllerAnimated:YES];
}

- (IBAction)unwindToPreviousViewControllerInStackControllerNotAnimated:(UIStoryboardSegue *)sender
{
    NSAssert(self.stackController, @"The view controller must be contained within a stack controller");
    [self.stackController popViewControllerAnimated:NO];
}

- (IBAction)unwindToRootViewControllerInStackControllerAnimated:(UIStoryboardSegue *)sender
{
    NSAssert(self.stackController, @"The view controller must be contained within a stack controller");
    [self.stackController popToRootViewControllerAnimated:YES];
}

- (IBAction)unwindToRootViewControllerInStackControllerNotAnimated:(UIStoryboardSegue *)sender
{
    NSAssert(self.stackController, @"The view controller must be contained within a stack controller");
    [self.stackController popToRootViewControllerAnimated:NO];
}

@end
