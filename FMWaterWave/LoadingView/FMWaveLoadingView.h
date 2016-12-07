//
//  FMWaveLoadingView.h
//  FMWaterWave
//
//  Created by fm on 16/12/7.
//  Copyright © 2016年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface FMWaveLoadingView : UIView

+ (instancetype)loadingView;

- (void)startLoading;

- (void)stopLoading;

@end
NS_ASSUME_NONNULL_END

