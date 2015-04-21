//
//  ShareUtilityViewController.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 21/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "BLCMedia.h"

@interface ShareUtility : NSObject


+ (UIViewController *) shareMediaVC:(BLCMedia *)media;

@end
