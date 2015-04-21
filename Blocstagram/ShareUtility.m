//
//  ShareUtilityViewController.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 21/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "ShareUtility.h"


@interface ShareUtility ()

@end

@implementation ShareUtility



+ (UIViewController *) shareMediaVC:(BLCMedia *)media {
    NSString *caption = media.caption;
    NSLog(@"caption is:%@",caption);
    
    
    
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (media.caption.length > 0) {
        [itemsToShare addObject:media.caption];
    }
    
    if (media.image) {
        [itemsToShare addObject:media.image];
    }
    
    if (itemsToShare.count > 0) {
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    
    
    return activityVC;
    }
    
    return nil;
}


@end
