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

+(instancetype) sharedInstance;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

- (void) deleteMediaItem:(BLCMedia *)item;
- (void) requestNewItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(BLCNewItemCompletionBlock)completionHandler;

+ (NSString *) instagramClientID; // why the + sign, why not as a property?


@end
