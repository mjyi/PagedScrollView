//
//  NSTimer+YJBlock.h
//  JJBanner
//
//  Created by mervin on 2017/7/31.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSTimer (YJBlock)

+ (NSTimer *)yj_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

+ (NSTimer *)yj_timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
NS_ASSUME_NONNULL_END
