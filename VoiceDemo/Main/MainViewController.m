//
//  MainViewController.m
//  VoiceDemo
//
//  Created by Song Jinwei on 2018/3/19.
//  Copyright © 2018年 Song Jinwei. All rights reserved.
//

#import "MainViewController.h"
#import "SCListener.h"

@interface MainViewController ()

@property (nonatomic,retain)NSTimer *timer;
@property (nonatomic,retain) SCListener *listener;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)timeAction:(NSTimer *)timer
{
    if (self.listener)
    {
        AudioQueueLevelMeterState *levels = [self.listener levels];
        Float32 peak = levels[0].mPeakPower;
        Float32 average = levels[0].mAveragePower;
        
        if (![_listener isListening]) // If listener has paused or stopped…
            return; // …bail.
        self.avaSlider.value = average;
        self.maxSlider.value = peak;
        
        NSLog(@"录音的最大音量：%0.5f,平均音量：%0.5f",peak,average);
    }
}


- (IBAction)startClicl:(id)sender
{
    //開始偵測
    [[SCListener sharedListener] listen];
    
    //取得平均音量
    [[SCListener sharedListener] averagePower];
    
    //取得最大音量
    [[SCListener sharedListener] peakPower];
    
    SCListener *listener_t = [SCListener sharedListener];
    self.listener = listener_t;
}

- (IBAction)pauseClick:(UIButton *)sender
{
    [_listener pause];
    [_listener listen]; // Quick.
}
@end
