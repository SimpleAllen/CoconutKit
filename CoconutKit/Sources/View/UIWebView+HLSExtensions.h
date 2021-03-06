//
//  Copyright (c) Samuel Défago. All rights reserved.
//
//  Licence information is available from the LICENCE file.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIWebView (HLSExtensions)

/**
 * If set to YES, the web view background is completely transparent
 */
@property (nonatomic, assign, getter=isTransparent) BOOL transparent;

@end
