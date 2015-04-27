//
//  BLCMediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 21/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCMediaFullScreenViewController.h"
#import "BLCMedia.h"
#import "ShareUtility.h"

@interface BLCMediaFullScreenViewController () <UIScrollViewDelegate>


@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UILabel *placeholder;


@end

@implementation BLCMediaFullScreenViewController


- (instancetype) initWithMedia:(BLCMedia *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
   
    
    
    
    
    return self;
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [UIScrollView new]; // is this an alternative to Alloc/Init
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    self.scrollView.contentSize = self.media.image.size;
    
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    
    
    // add share button
    self.shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.shareButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
    self.shareButton.backgroundColor = [UIColor whiteColor];
    self.shareButton.titleLabel.textColor = [UIColor blueColor];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    self.shareButton.alpha = 0.5;
    self.shareButton.frame = CGRectMake(self.view.bounds.size.width - 20 - 50, 45, 50, 20);
    
    [self.shareButton addTarget:self action:@selector(sharePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.shareButton];
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.scrollView.frame = self.view.bounds;
    [self recalculateZoomScale];
}

- (void) recalculateZoomScale {

    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    scrollViewContentSize.height /= self.scrollView.zoomScale;
    scrollViewContentSize.width /= self.scrollView.zoomScale;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self centerScrollView];
}


- (void)centerScrollView {
    [self.imageView sizeToFit];
    
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.x = 0;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
    } else {
        contentsFrame.origin.y = 0;
    }
    
    self.imageView.frame = contentsFrame;
}



#pragma mark - UIScrollViewDelegate

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Gesture Recognizers

- (void) tapFired:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
    } else {
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
}




#pragma mark - Button Pressed

- (void) sharePressed:(id)sender{
    NSLog(@"share button pressed");
    
    UIViewController *shareVC = [ShareUtility shareMediaVC:self.media];
    if (shareVC) {
        [self presentViewController:shareVC animated:YES completion:nil];
    }
}


@end
