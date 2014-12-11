//
//  ViewController.m
//  AVPlayer
//
//  Created by chen on 14/12/2.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>{
    AVAudioPlayer *aVAudioPlayer;
}
@property (weak, nonatomic) IBOutlet UIButton *playerBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)player:(id)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
- (IBAction)changeSound:(UISlider *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *pathStr =  [[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp3"];
    aVAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathStr] error:nil];
    [aVAudioPlayer prepareToPlay];
    aVAudioPlayer.delegate = self;
    _timeLabel.text = [NSString stringWithFormat:@"%f", aVAudioPlayer.duration];
    if ([aVAudioPlayer play]) {
        NSLog(@"开始播放");
    }
    _soundSlider.maximumValue = 1.0;
    _soundSlider.minimumValue = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)player:(id)sender {
    aVAudioPlayer.playing ? [aVAudioPlayer stop] : [aVAudioPlayer play];
    
}
- (IBAction)changeSound:(UISlider *)sender {
    aVAudioPlayer.volume = sender.value;
    if ([ViewController instanceMethodForSelector:@selector(viewDidAppear:)]){
        NSLog(@"instanceMethodForSelector");
    }
}

@end
