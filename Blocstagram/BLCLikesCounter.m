//
//  BLCLikesCounter.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 23/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCLikesCounter.h"

@interface BLCLikesCounter()

@property (nonatomic, strong) UILabel *likesCountLabel;


@end





@implementation BLCLikesCounter

- (instancetype) initWithLikesCount {
    self = [super init];
    
    if (self) {
        self.likesCountLabel = [[UILabel alloc] init];
        self.likesCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:11];
        self.likesCountLabel.text = @"12345678";
        
        [self addSubview:self.likesCountLabel];
    }
    
    return self;
}





@end
