//
//  BLCMedia.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 16/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCMedia.h"
#import "BLCUser.h"
#import "BLCComment.h" // added this in otherwise error



@implementation BLCMedia

- (instancetype) initWithDictionary:(NSDictionary *)mediaDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = mediaDictionary[@"id"];
        self.user = [[BLCUser alloc] initWithDictionary:mediaDictionary[@"user"]];
        NSString *standardResolutionImageURLString = mediaDictionary[@"images"][@"standard_resolution"][@"url"];
        NSURL *standardResolutionImageURL = [NSURL URLWithString:standardResolutionImageURLString];
        
        if (standardResolutionImageURL) {
            self.mediaURL = standardResolutionImageURL;
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError; // why this state?
        }
        
        NSDictionary *captionDictionary = mediaDictionary[@"caption"];
        
        
        if ([captionDictionary isKindOfClass:[NSDictionary class]]) {
            self.caption = captionDictionary[@"text"];
        } else {
            self.caption = @"";
        }
        
        NSMutableArray *commentsArray = [NSMutableArray array]; // why not [[NSMutableArray alloc] init]
        
        for (NSDictionary *commentDictionary in mediaDictionary[@"comments"][@"data"]) {
            BLCComment *comment = [[BLCComment alloc] initWithDictionary:commentDictionary];
            [commentsArray addObject:comment];
        }
        
        self.comments = commentsArray;
        
        BOOL userHasLiked = [mediaDictionary[@"user_has_liked"] boolValue]; // when is this put into mediaDictionary?
        self.likeState = userHasLiked ? BLCLikeStateLiked : BLCLikeStateNotLiked;
        
        
        NSDictionary *likesCounterDictionary = mediaDictionary[@"likes"];
        if ([likesCounterDictionary isKindOfClass:[NSDictionary class]]) {
//            self.likesCounter = [[BLCLikesCounter alloc] initWithDictionary:likesCounterDictionary];
            self.likesCount = [likesCounterDictionary[@"count"] integerValue];
            NSLog(@"QQQQQQQQQ count is %ld", (long)self.likesCount);
            
        }
        
        
    }
    
    return self;
}




#pragma mark - NSCoding

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.idNumber = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(idNumber))];
        self.user = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(user))];
        self.mediaURL = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(mediaURL))];
        self.image = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(image))];
        
        if (self.image) {
            self.downloadState = BLCMediaDownloadStateHasImage;
        } else if (self.mediaURL) {
            self.downloadState = BLCMediaDownloadStateNeedsImage;
        } else {
            self.downloadState = BLCMediaDownloadStateNonRecoverableError;
        }
        
        
        
        
        self.caption = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(caption))];
        self.comments = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(comments))];
        self.likeState = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(likeState))];
        self.likesCount = [aDecoder decodeIntegerForKey:NSStringFromSelector(@selector(likesCount))];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.idNumber forKey:NSStringFromSelector(@selector(idNumber))];
    [aCoder encodeObject:self.user forKey:NSStringFromSelector(@selector(user))];
    [aCoder encodeObject:self.mediaURL forKey:NSStringFromSelector(@selector(mediaURL))];
    [aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))];
    [aCoder encodeObject:self.caption forKey:NSStringFromSelector(@selector(caption))];
    [aCoder encodeObject:self.comments forKey:NSStringFromSelector(@selector(comments))];
    [aCoder encodeInteger:self.likeState forKey:NSStringFromSelector(@selector(likeState))];
    [aCoder encodeInteger:self.likesCount forKey:NSStringFromSelector(@selector(likesCount))];
    
}









@end
