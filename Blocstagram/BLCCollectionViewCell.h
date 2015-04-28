//
//  BLCCollectionViewCell.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 28/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//


@class BLCCollectionViewCell;


#import <UIKit/UIKit.h>

@interface BLCCollectionViewCell : UICollectionViewCell


@property (nonatomic, strong) UIImageView *thumbnail;
@property (nonatomic, strong) UILabel *label;




-(BLCCollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath thumbnailEdgeSize:(CGFloat)thumbnailEdgeSize labelText:(NSString *)label thumbnailImage:(UIImage *)thumbnail;



@end
