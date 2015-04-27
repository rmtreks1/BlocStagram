//
//  BLCImageLibraryCollectionViewController.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 27/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCImageLibraryViewController;

@protocol BLCImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(BLCImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface BLCImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <BLCImageLibraryViewControllerDelegate> *delegate;

@end