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
        self.backgroundColor = [UIColor grayColor]; // for testing only - remove this line on final build
        
    }
    
    
    return self;
}


-(BLCCollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath thumbnailEdgeSize:(CGFloat)thumbnailEdgeSize labelText:(NSString *)label thumbnailImage:(UIImage *)thumbnail
 {
    
    BLCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    static NSInteger imageViewTag = 1000;
    static NSInteger labelTag = 1001;
    
    cell.thumbnail = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
    cell.label = (UILabel *)[cell.contentView viewWithTag:labelTag];
//    
//    
//    UIImageView *thumbnail = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
//    UILabel *label = (UILabel *)[cell.contentView viewWithTag:labelTag];

    
    if (!cell.thumbnail) {
        cell.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
        cell.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        cell.thumbnail.tag = imageViewTag;
        cell.thumbnail.clipsToBounds = YES;
        
//        cell.thumbnail.backgroundColor = [UIColor blueColor]; //
        
        [cell.contentView addSubview:cell.thumbnail];
    }
    
    if (!cell.label) {
        cell.label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
        cell.label.tag = labelTag;
        cell.label.textAlignment = NSTextAlignmentCenter;
        cell.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        [cell.contentView addSubview:cell.label];
    }

    
     cell.label.text = label;
     cell.thumbnail.image = thumbnail;
     
     
    
//    // testing that inputs received
//    NSLog(@"label received into collection view cell is %@", label);
//    NSLog(@"label in collection view cell is %@", cell.label.text);
//     if (thumbnail) {
//         NSLog(@"thumbnail received");
//     }
//     
//     if (cell.thumbnail.image) {
//         NSLog(@"thumbnail in cell");
//     }

     
     
     
    
    return cell;
    
}



@end
