//
//  BLCCameraToolbar.h
//  Blocstagram
//
//  Created by Roshan Mahanama on 26/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCCameraToolbar;

@protocol BLCCameraToolbarDelegate <NSObject>

- (void) leftButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;
- (void) rightButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;
- (void) cameraButtonPressedOnToolbar:(BLCCameraToolbar *)toolbar;

@end

@interface BLCCameraToolbar : UIView

- (instancetype) initWithImageNames:(NSArray *)imageNames;

@property (nonatomic, weak) NSObject <BLCCameraToolbarDelegate> *delegate;

@end