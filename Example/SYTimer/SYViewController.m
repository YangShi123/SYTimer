//
//  SYViewController.m
//  SYTimer
//
//  Created by YangShi123 on 11/16/2021.
//  Copyright (c) 2021 YangShi123. All rights reserved.
//

#import "SYViewController.h"
#import "SYTimer.h"

@interface SYViewController ()

@property (nonatomic, strong) SYTimer * timer;

@end

@implementation SYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"---begin");
//    self.timer = [SYTimer excuteTask:^{
//        NSLog(@"task  %@", [NSThread currentThread]);
//    } delta:0 interval:1 repeats:YES async:YES];
    self.timer = [SYTimer excuteReverseTask:^(NSTimeInterval remain) {
        NSLog(@"%f", remain);
    } total:10 delta:0 interval:1 async:YES completion:^{
        NSLog(@"---completion");
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [SYTimer cancelTask:self.timer];
    NSLog(@"---end");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
