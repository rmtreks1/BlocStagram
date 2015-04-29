//
//  BLCComposeCommentViewTests.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 29/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BLCComposeCommentView.h"


@interface BLCComposeCommentViewTests : XCTestCase


@end

@implementation BLCComposeCommentViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testSetText {

    // setting up the commentView
    CGRect testFrame = CGRectMake(0.0f, 0.0f, 400.0f, 600.0f);
    BLCComposeCommentView *testCommentView = [[BLCComposeCommentView alloc]initWithFrame:testFrame];

    
    // text is NOT entered
    [testCommentView setText:@""];
    XCTAssertTrue(!testCommentView.isWritingComment, @"should be false");
    
    // text is entered
    [testCommentView setText:@"Ah yes! I was wondering what would weight first. Your spirit... or your body?"];
    XCTAssertTrue(testCommentView.isWritingComment, @"should be true");
    
    
}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
