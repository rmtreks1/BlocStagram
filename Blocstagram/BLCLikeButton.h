//
//  BLCLikeButton.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 23/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BLCLikeState) {
    BLCLikeStateNotLiked = 0,
    BLCLikeStateLiking = 1,
    BLCLikeStateLiked = 2,
    BLCLikeStateUnliking = 3
};


@interface BLCLikeButton : UIButton

@property (nonatomic, assign) BLCLikeState likeButtonState;


@end
