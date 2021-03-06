//
//  Copyright (c) Samuel Défago. All rights reserved.
//
//  Licence information is available from the LICENCE file.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITextField (HLSExtensions)

/**
 * If set to YES, the text field resigns its first responder status when the user taps outside it 
 *
 * The default value is NO
 */
@property (nonatomic, assign, getter=isResigningFirstResponderOnTap) BOOL resigningFirstResponderOnTap;

@end
