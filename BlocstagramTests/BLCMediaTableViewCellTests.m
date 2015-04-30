//
//  BLCMediaTableViewCellTests.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 29/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMediaTableViewCell.h"
#import "BLCMedia.h"
#import "BLCUser.h"


@interface BLCMediaTableViewCellTests : XCTestCase

@property (nonatomic, strong) BLCMedia *testMedia;

@end

@implementation BLCMediaTableViewCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSDictionary *testMediaDictionary = @{
                                 @"id": @"12345a",
                                 @"user": @{@"id": @"8675309",
                                            @"username" : @"d'oh",
                                            @"full_name" : @"Homer Simpson",
                                            @"profile_picture" : @"http://www.example.com/example.jpg"},
                                 @"comments": @{
                                         @"data": @[@{
                                                        @"created_time": @"1279332030",
                                                        @"text": @"Love the sign here",
                                                        @"from": @{
                                                                @"username": @"mikeyk",
                                                                @"full_name": @"Mikey Krieger",
                                                                @"id": @"4",
                                                                @"profile_picture": @"http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg"
                                                                },
                                                        @"id": @"8"
                                                        }],
                                         },
                                 @"user_has_liked": @TRUE,
                                 @"likes": @{
                                         @"count": @1,
                                         @"data": @[@{
                                                        @"username": @"mikeyk",
                                                        @"full_name": @"Mikeyk",
                                                        @"id": @"4",
                                                        @"profile_picture": @"..."
                                                        }]},
                                 @"caption": @{
                                         @"text": @"amazing caption for this picture",
                                         },
                                 };

    
    self.testMedia = [[BLCMedia alloc] initWithDictionary:testMediaDictionary];
    
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testHeightForMediaItemFullImageWidth {
    
    
    self.testMedia.image = [UIImage imageNamed:@"1.JPG"];
    
    CGFloat imageHeight = self.testMedia.image.size.height;
    CGFloat imageWidth = self.testMedia.image.size.width;
    
    
    CGFloat testResultHeight = [BLCMediaTableViewCell heightForMediaItem:self.testMedia width:imageWidth];
    
    NSLog(@"image height is: %f , testResultHeight is %f", imageHeight, testResultHeight);
    
    XCTAssertGreaterThan(testResultHeight, imageHeight, @"cell height %f should be taller than image %f", testResultHeight, imageHeight);
    
}



- (void)testHeightForMediaItemHalfImageWidth {
    
    
    self.testMedia.image = [UIImage imageNamed:@"1.JPG"];
    
    CGFloat imageHeight = self.testMedia.image.size.height/2;
    CGFloat imageWidth = self.testMedia.image.size.width/2;
    
    
    CGFloat testResultHeight = [BLCMediaTableViewCell heightForMediaItem:self.testMedia width:imageWidth];
    
    NSLog(@"image height is: %f , testResultHeight is %f", imageHeight, testResultHeight);
    
    XCTAssertGreaterThan(testResultHeight, imageHeight, @"cell height %f should be taller than image %f", testResultHeight, imageHeight);
    
}








@end
