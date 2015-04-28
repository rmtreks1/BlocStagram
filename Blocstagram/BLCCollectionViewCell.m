//
//  BLCCollectionViewCell.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 28/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCCollectionViewCell.h"





@implementation BLCCollectionViewCell




-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    NSLog(@"using BLC Collection View Cell");
    
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor]; // for testing only - remove this line on final build
        
        self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnail.clipsToBounds = YES;
        [self.contentView addSubview:self.thumbnail];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        [self.contentView addSubview:self.label];
        
    }
    
    
    return self;
}


-(void) setThumbnailEdgeSize:(CGFloat)thumbnailEdgeSize labelText:(NSString *)label thumbnailImage:(UIImage *)thumbnail
 {
     self.thumbnail.frame = CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize);
     self.label.frame = CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20);
    
     self.label.text = label;
     self.thumbnail.image = thumbnail;
     
     
}



@end
