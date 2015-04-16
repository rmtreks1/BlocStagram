//
//  BLCImagesTableViewController.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 16/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCImagesTableViewController.h"
#import "BLCDataSource.h"
#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h"

@interface BLCImagesTableViewController ()

@end

@implementation BLCImagesTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self items].count;
}



 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
     
     // Configure the cell...
     static NSInteger imageViewTag = 1234;
     UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageViewTag];
     
     if (!imageView) {
         // This is a new cell, it doesn't have an image view yet
         imageView = [[UIImageView alloc] init];
         imageView.contentMode = UIViewContentModeScaleToFill;
         
         imageView.frame = cell.contentView.bounds;
         imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
         
         imageView.tag = imageViewTag;
         [cell.contentView addSubview:imageView];
     }
     
     BLCMedia *item = [self items][indexPath.row];
     imageView.image = item.image;
     
     return cell;
 }


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BLCMedia *item = [self items][indexPath.row];
    UIImage *image = item.image;
    
//    NSLog(@"%lu", [self items].count); // checking that the function works
    
    return (CGRectGetWidth(self.view.frame) / image.size.width) * image.size.height;

}

// Not sure how to do this part since BLCDatasource media is read only
//- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [[BLCDataSource sharedInstance].mediaItems removeObjectAtIndex:indexPath.row];
//        [tableView reloadData];
//        
//        NSLog(@"user swipe to delete");
//    }
//
//}


- (NSArray *) items {
    return [BLCDataSource sharedInstance].mediaItems;
}



@end
