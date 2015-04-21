//
//  ShareUtilityViewController.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 21/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "ShareUtilityViewController.h"


@interface ShareUtilityViewController ()

@end

@implementation ShareUtilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (void) shareMedia:(BLCMedia *)media {
    NSString *caption = media.caption;
    NSLog(@"caption is:%@",caption);
    
    
    
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    [itemsToShare addObject:media];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    
    
    
//    [self presentViewController:activityVC animated:YES completion:nil];
    
    
    //
    //    if (self.media.caption.length > 0) {
    //        [itemsToShare addObject:self.media.caption];
    //    }
    //
    //    if (self.media.image) {
    //        [itemsToShare addObject:self.media.image];
    //    }
    //
    //    if (itemsToShare.count > 0) {
    //        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    //        [self presentViewController:activityVC animated:YES completion:nil];
    //    }

    
    
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
