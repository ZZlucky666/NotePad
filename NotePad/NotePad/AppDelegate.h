//
//  AppDelegate.h
//  NotePad
//
//  Created by Jack Zeng on 16/12/27.
//  Copyright © 2016年 Jack Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

