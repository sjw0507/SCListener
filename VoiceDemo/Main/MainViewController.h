//
//  MainViewController.h
//  VoiceDemo
//
//  Created by Song Jinwei on 2018/3/19.
//  Copyright © 2018年 Song Jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *avaSlider;
@property (weak, nonatomic) IBOutlet UISlider *maxSlider;

- (IBAction)startClicl:(id)sender;
- (IBAction)pauseClick:(UIButton *)sender;

@end
