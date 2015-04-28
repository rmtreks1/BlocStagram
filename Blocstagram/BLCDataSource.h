//
//  BLCDataSource.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 16/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

@class BLCMedia;



#import <Foundation/Foundation.h>

typedef void (^BLCNewItemCompletionBlock)(NSError *error);


@interface BLCDataSource : NSObject

extern NSString *const BLCImageFinishedNotification;

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

- (void) deleteMediaItem:(BLCMedia *)item;
- (void) requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) downloadImageForMediaItem: (BLCMedia *)mediaItem;
- (void) toggleLikeOnMediaItem: (BLCMedia *)mediaItem;
- (void) commentOnMediaItem:(BLCMedia *)mediaItem withCommentText:(NSString *)commentText;



+ (NSString *) instagramClientID; // why the + sign, why not as a property?


@end
