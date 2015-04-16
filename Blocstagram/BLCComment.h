//
//  BLCComment.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 16/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLCUser;

@interface BLCComment : NSObject

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) BLCUser *from;
@property (nonatomic, strong) NSString *text;


@end
