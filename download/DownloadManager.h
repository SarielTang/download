//
//  DownloadManager.h
//  02-下载文件
//
//  Created by amesty on 15/6/25.
//  Copyright (c) 2015年 cf. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 下载管理器，负责管理所有的下载操作，可以控制最大并发的操作数！
 
 通常，为了方便其他程序的调用，管理工具会设计成单例
 
 开发步骤：
 1. 实现单例
 2. 接管下载操作，当前实现的功能！
 */
@class DownloadOperation;
@interface DownloadManager : NSObject

@property (nonatomic,strong)NSMutableArray *downloadingTasks;
//@property (nonatomic,strong)NSMutableDictionary *finishedTasks;

+ (instancetype)sharedManager;

// 下载的主方法
- (void)downloadWithURL:(NSURL *)url progress:(void (^)(float progress))progress finished:(void (^)(DownloadOperation *operation, NSError *error))finished;

// 暂停指定 URL 的下载操作
- (void)pauseWithURL:(NSURL *)url;

@end
