//
//  ViewController.m
//  FMWaterWave
//
//  Created by fm on 16/12/7.
//  Copyright © 2016年 wangjiuyin. All rights reserved.
//

#import "ViewController.h"
#import "FMWaveLoadingView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) FMWaveLoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _loadingView = [FMWaveLoadingView loadingView];
    [self.view addSubview:_loadingView];
    _loadingView.center = self.view.center;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_loadingView startLoading];
    });
}

- (void)beginLoading:(id)sender
{
    [_loadingView startLoading];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
