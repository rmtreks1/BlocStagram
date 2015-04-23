//
//  BLCLikesCounter.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 23/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLCLikesCounter : UIView



@property (nonatomic, assign) NSString *likesCount;


- (instancetype) initWithLikesCount;
- (instancetype) initWithDictionary:(NSDictionary *)likesDictionary;



@end
