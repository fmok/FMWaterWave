//
//  AppDelegate.h
//  FMWaterWave
//
//  Created by fm on 16/12/7.
//  Copyright © 2016年 wangjiuyin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

