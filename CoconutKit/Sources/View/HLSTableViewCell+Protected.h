//
//  Copyright (c) Samuel Défago. All rights reserved.
//
//  Licence information is available from the LICENCE file.
//

#import "HLSTableViewCell.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * Just to be used by subclasses of HLSTableViewCell within the CoconutKit framework (the ones needing
 * access to styles). Not to be published in the library public headers
 */
@interface HLSTableViewCell (Protected)

+ (UITableViewCellStyle)style;

@end
