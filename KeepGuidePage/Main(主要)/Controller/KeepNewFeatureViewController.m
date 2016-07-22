//
//  KeepNewFeatureViewController.m
//  KeepGuidePage
//
//  Created by Michael on 16/7/22.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "KeepNewFeatureViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "KeepNewFeatrueView.h"

@interface KeepNewFeatureViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (nonatomic, strong) KeepNewFeatrueView *keepView;

@end

@implementation KeepNewFeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"keep" ofType:@"mp4"];
    
    self.moviePlayerController.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    
    [self.moviePlayerController play];
    
    [self.moviePlayerController.view bringSubviewToFront:self.keepView];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.moviePlayerController playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.moviePlayerController play];
    }
}


#pragma mark - setter and getter
- (MPMoviePlayerController *)moviePlayerController
{
    if (!_moviePlayerController) {
        
        _moviePlayerController = [[MPMoviePlayerController alloc] init];
        
        [_moviePlayerController setShouldAutoplay:YES];
        
        _moviePlayerController.movieSourceType = MPMovieSourceTypeFile;
        [_moviePlayerController setFullscreen:YES];
        
        [_moviePlayerController setRepeatMode:MPMovieRepeatModeOne];
        _moviePlayerController.controlStyle = MPMovieControlStyleNone;
        _moviePlayerController.view.frame = [UIScreen mainScreen].bounds;
        
        [self.view addSubview:self.moviePlayerController.view];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        
    }
    return _moviePlayerController;
}

- (KeepNewFeatrueView *)keepView
{
    if (!_keepView) {
        _keepView = [[KeepNewFeatrueView alloc] init];
        _keepView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.moviePlayerController.view addSubview:_keepView];
    }
    return _keepView;
}

@end
