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


- (instancetype) init {
    self = [super init];
    
    if (self) {

        self.likesCountLabel = [[UILabel alloc] init];
        self.likesCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:11];
        self.likesCountLabel.textAlignment = NSTextAlignmentRight;
        self.likesCountLabel.frame = CGRectMake(0, 0, 44, 44);
        
        [self addSubview:self.likesCountLabel];
    }
    return self;
}





- (instancetype) initWithLikesCount: (NSInteger)likesCount {
    self = [super init];
    
    if (self) {
        
        NSString *likesCountText = [NSString stringWithFormat:@"%ld", (long)likesCount];
        
        self.likesCountLabel = [[UILabel alloc] init];
        self.likesCountLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:11];
        self.likesCountLabel.text = likesCountText;
        self.likesCountLabel.textAlignment = NSTextAlignmentRight;
//        self.likesCountLabel.textColor = [UIColor whiteColor];
        self.likesCountLabel.frame = CGRectMake(0, 0, 44, 44);
        
        [self addSubview:self.likesCountLabel];
        
        
        
    }
    
    return self;
}



- (void) setLikesCount: (NSInteger)likesCount {
    NSString *likesCountText = [NSString stringWithFormat:@"%ld", (long)likesCount];
    self.likesCountLabel.text = likesCountText;
}


@end
