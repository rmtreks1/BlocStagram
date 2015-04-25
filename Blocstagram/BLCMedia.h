//
//  BLCMedia.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 16/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // Add this for UIImage
#import "BLCLikeButton.h"
#import "BLCLikesCounter.h"



typedef NS_ENUM(NSInteger, BLCMediaDownloadState) {
    BLCMediaDownloadStateNeedsImage             = 0,
    BLCMediaDownloadStateDownloadInProgress     = 1,
    BLCMediaDownloadStateNonRecoverableError    = 2,
    BLCMediaDownloadStateHasImage               = 3
};




@class BLCUser;
//@class BLCComment; // added this in otherwise error



@interface BLCMedia : NSObject <NSCoding>

@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, strong) BLCUser *user;
@property (nonatomic, strong) NSURL *mediaURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) BLCMediaDownloadState downloadState;
@property (nonatomic, assign) BLCLikeState likeState;
@property (nonatomic, assign) NSInteger likesCount;
@property (nonatomic, strong) NSString *temporaryComment;

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary;


@end
