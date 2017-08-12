//
//  NSTimer+YJBlock.m
//  JJBanner
//
//  Created by mervin on 2017/7/31.
//  Copyright © 2017年 mervin. All rights reserved.
//

#import "NSTimer+YJBlock.h"

@implementation NSTimer (YJBlock)



+ (NSTimer *)yj_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block  {
    
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(executeBlock:) userInfo:[block copy] repeats:repeats];
    
}

+ (NSTimer *)yj_timerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    
    return [self timerWithTimeInterval:ti target:self selector:@selector(executeBlock:) userInfo:[block copy] repeats:repeats];
    
}


+ (void)executeBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

#pragma mark - pause/resume
-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
