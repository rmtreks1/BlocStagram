//
//  BLCMediaTests.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 29/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h"

@interface BLCMediaTests : XCTestCase

@property (nonatomic, strong) NSDictionary *mediaDictionary;
@property (nonatomic, strong) BLCUser *testUser;
@property (nonatomic, strong) BLCComment *testComment;




@end

@implementation BLCMediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.mediaDictionary = @{
                                      @"id": @"12345a",
                                      @"user": @{@"id": @"8675309",
                                                 @"username" : @"d'oh",
                                                 @"full_name" : @"Homer Simpson",
                                                 @"profile_picture" : @"http://www.example.com/example.jpg"},
                                      @"images": @{
                                              @"low_resolution": @{
                                                      @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_6.jpg",
                                                      @"width": @306,
                                                      @"height": @306
                                                      },
                                              @"thumbnail": @{
                                                      @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_5.jpg",
                                                      @"width": @150,
                                                      @"height": @150
                                                      },
                                              @"standard_resolution": @{
                                                      @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_7.jpg",
                                                      @"width": @612,
                                                      @"height": @612
                                                      }
                                              },
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
                                      };
    
    
    
    
    self.testUser = [[BLCUser alloc] initWithDictionary:self.mediaDictionary[@"user"]];
    self.testComment = [[BLCComment alloc] initWithDictionary:self.mediaDictionary[@"comments"]];
    
    
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testInitializeridNumberReturned {
    
    BLCMedia *testMedia = [[BLCMedia alloc] initWithDictionary:self.mediaDictionary];
    
    // test ID number
    XCTAssertEqualObjects(testMedia.idNumber, self.mediaDictionary[@"id"], @"id number should be equal");
    
    // test likeState
    XCTAssertEqual(testMedia.likeState, BLCLikeStateLiked, @"like state should match");
    
    // test likesCount
    NSInteger likesCount = [self.mediaDictionary[@"likes"][@"count"] integerValue];
    XCTAssertEqual(testMedia.likesCount, likesCount, @"the likes count should match");
    
    // test BLCUser being returned correctly
    XCTAssertEqualObjects(testMedia.user.idNumber, self.testUser.idNumber, @"user id should be the same");
    XCTAssertEqualObjects(testMedia.user.userName, self.testUser.userName, @"user names should be the same");
    XCTAssertEqualObjects(testMedia.user.fullName, self.testUser.fullName, @"user full names should be the same");
    XCTAssertEqualObjects(testMedia.user.profilePictureURL, self.testUser.profilePictureURL, @"user profilePictureURL should be the same");
    
    // test BLCComment being returned correctly
    BLCComment *testMediaComment = testMedia.comments[0];
    NSString *testMediaCommentText = testMediaComment.text;
    NSString *correctMediaCommentText = self.mediaDictionary[@"comments"][@"data"][0][@"text"];
    XCTAssertEqualObjects(testMediaCommentText, correctMediaCommentText, @"comments should be equal");
    
    
    // test Caption when no caption provided
    if (!self.mediaDictionary[@"caption"]) {
        NSLog(@"no caption provided");
        // should not return a caption
        XCTAssertEqualObjects(testMedia.caption, @"", @"caption should be nil when no caption provided");
        
    } else if (self.mediaDictionary[@"caption"]) {
        NSString *caption = self.mediaDictionary[@"caption"][@"text"];
        XCTAssertEqualObjects(testMedia.caption, caption, @"caption should match what was provided");
    }
    
    
    
};


- (void) testInitializerWithCaptionProvided {

    NSDictionary *captionDictionary = {@"caption" : @{@"text": "wow some caption provided"}};
    self.mediaDictionary[@"caption"] = [@{@"text": @"wow some caption provided"}];
    [self.mediaDictionary addEntriesFromDictionary:caption]
}




- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
