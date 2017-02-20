# 仿KEEP引导页


![效果图](https://github.com/sunjinshuai/Keep/blob/master/Keep.gif)

===================================  

自己闲暇时间做了一个高仿KEEP的引导页。用的是系统SDK播放视频MediaPlayer，提供的MPMoviePlayerViewController类作为开发使用。

***MPMoviePlayerController***

```
- (MPMoviePlayerController *)moviePlayerController
{
    if (!_moviePlayerController) {
        _moviePlayerController = [[MPMoviePlayerController alloc] init];
        _moviePlayerController.movieSourceType = MPMovieSourceTypeFile;
        _moviePlayerController.controlStyle = MPMovieControlStyleNone;
        _moviePlayerController.view.frame = [UIScreen mainScreen].bounds;
        [_moviePlayerController setFullscreen:YES];
        [_moviePlayerController setShouldAutoplay:YES];
        [_moviePlayerController setRepeatMode:MPMovieRepeatModeOne];
        [self.view addSubview:self.moviePlayerController.view];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];

    }
    return _moviePlayerController;
}
```

## **Complex Usage**

| **Property**                                  | **Description**                             |
| ----------------------------------------------| ------------------------------------------- |
| @property (nonatomic, copy) NSURL *contentURL | 播放媒体URL，这个URL可以是本地路径，也可以是网络路径 |
| @property (nonatomic, readonly) UIView *view            | 	播放器视图，如果要显示视频必须将此视图添加到控制器视图中  |
| @property (nonatomic, readonly) UIView *backgroundView      | 播放器背景视图  |
| @property (nonatomic, readonly) MPMoviePlaybackState playbackState          | 媒体播放状态，枚举类型：MPMoviePlaybackStateStopped：停止播放MPMoviePlaybackStatePlaying：正在播放MPMoviePlaybackStatePaused：暂停MPMoviePlaybackStateInterrupted：中断MPMoviePlaybackStateSeekingForward：向前定位MPMoviePlaybackStateSeekingBackward：向后定位                     |
| @property (nonatomic, readonly) MPMovieLoadState loadState | 网络媒体加载状态，枚举类型：MPMovieLoadStateUnknown：位置类型MPMovieLoadStatePlayable：MPMovieLoadStatePlaythroughOK：这种状态如果shouldAutoPlay为YES将自动播放MPMovieLoadStateStalled：停滞状态 |
| @property (nonatomic) MPMovieControlStyle controlStyle      | 控制面板风格，枚举类型：MPMovieControlStyleNone：无控制面板 MPMovieControlStyleEmbedded：嵌入视频风格 MPMovieControlStyleFullscreen：全屏 MPMovieControlStyleDefault：默认风格|
| @property (nonatomic) MPMovieRepeatMode repeatMode;         | 重复播放模式，枚举类型:MPMovieRepeatModeNone:不重复，默认值MPMovieRepeatModeOne:重复播放 |
| @property (nonatomic) BOOL shouldAutoplay     | 当网络媒体缓存到一定数据时是否自动播放，默认为YES |
| @property (nonatomic, getter=isFullscreen) BOOL fullscreen | 是否全屏展示，默认为NO，注意如果要通过此属性设置全屏必须在视图显示完成后设置，否则无效  |
| @property (nonatomic) MPMovieScalingMode scalingMode | 视频缩放填充模式，枚举类型：MPMovieScalingModeNone：不进行任何缩放MPMovieScalingModeAspectFit：固定缩放比例并且尽量全部展示视频，不会裁切视频MPMovieScalingModeAspectFill：固定缩放比例并填充满整个视图展示，可能会裁切视频MPMovieScalingModeFill：不固定缩放比例压缩填充整个视图，视频不会被裁切但是比例失衡 |
| @property (nonatomic, readonly) BOOL readyForDisplay       | 是否有相关媒体被播放  |
|@property (nonatomic, readonly) MPMovieMediaTypeMask movieMediaTypes | 媒体类别，枚举类型：MPMovieMediaTypeMaskNone：未知类型MPMovieMediaTypeMaskVideo：视频MPMovieMediaTypeMaskAudio：音频	  |
| @property (nonatomic) MPMovieSourceType movieSourceType      | 	媒体源，枚举类型：MPMovieSourceTypeUnknown：未知来源MPMovieSourceTypeFile：本地文件MPMovieSourceTypeStreaming：流媒体（直播或点播） |
| @property (nonatomic, readonly) NSTimeInterval duration   | 媒体时长，如果未知则返回0   |
| @property (nonatomic, readonly) NSTimeInterval playableDuration   | 媒体可播放时长，主要用于表示网络媒体已下载视频时长 |
| @property (nonatomic, readonly) CGSize naturalSize     | 	视频实际尺寸，如果未知则返回CGSizeZero    |
| @property (nonatomic) NSTimeInterval initialPlaybackTime  | 起始播放时间   |
| @property (nonatomic) NSTimeInterval endPlaybackTime | 终止播放时间  |
| @property (nonatomic) BOOL allowsAirPlay|	是否允许无线播放，默认为YES |
| @property (nonatomic, readonly, getter=isAirPlayVideoActive) BOOL airPlayVideoActive | 当前媒体是否正在通过AirPlay播放 |
| @property(nonatomic, readonly) BOOL isPreparedToPlay   | 是否准备好播放       |
| @property(nonatomic) NSTimeInterval currentPlaybackTime  | 当前播放时间，单位：秒  |
| @property(nonatomic) float currentPlaybackRate   |	当前播放速度，如果暂停则为0，正常速度为1.0，非0数据表示倍率 |

| **对象方法**                                      | **说明**                             |
| ------------------------------------------------| ------------------------------------------- |
| - (instancetype)initWithContentURL:(NSURL *)url | 使用指定的URL初始化媒体播放控制器对象 |
| - (void)setFullscreen:(BOOL)fullscreen animated:(BOOL)animated  | 设置视频全屏，注意如果要通过此方法设置全屏则必须在其视图显示之后设置，否则无效|
| - (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option | 获取在指定播放时间的视频缩略图，第一个参数是获取缩略图的时间点数组；第二个参数代表时间点精度，枚举类型：MPMovieTimeOptionNearestKeyFrame：时间点附近MPMovieTimeOptionExact：准确时间               |
| - (void)cancelAllThumbnailImageRequests     | 取消所有缩略图获取请求                      |
| - (void)prepareToPlay  | 准备播放，加载视频数据到缓存，当调用play方法时如果没有准备好会自动调用此方法   |
| - (void)play    | 开始播放           |
| - (void)pause     | 暂停播放          |
| - (void)stop  | 停止播放        |
| - (void)beginSeekingForward | 向前定位       |
| - (void)beginSeekingBackward | 	向后定位|
| - (void)endSeeking    | 停止快进/快退                 |


