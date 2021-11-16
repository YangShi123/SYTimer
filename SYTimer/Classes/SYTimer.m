//

#import "SYTimer.h"

@interface SYTimer ()

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

@implementation SYTimer

+ (instancetype)excuteTask:(void (^)(void))task delta:(NSTimeInterval)delta interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async {
    if (!task || delta < 0 || (interval <= 0 && repeats)) { return nil; }
    /// 队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    SYTimer * timer = [[SYTimer alloc] init];
    /// 创建定时器
    timer.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    /// 设置定时器时间
    dispatch_source_set_timer(timer.gcdTimer,
                              dispatch_time(DISPATCH_TIME_NOW, delta * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC,
                              0);
    /// 设置回调
    dispatch_source_set_event_handler(timer.gcdTimer, ^{
        task();
        if (!repeats) {
            [self cancelTask:timer];
        }
    });
    /// 启动定时器
    dispatch_resume(timer.gcdTimer);
    return timer;
}

+ (instancetype)excuteReverseTask:(void (^)(NSTimeInterval remain))task total:(NSTimeInterval)total delta:(NSTimeInterval)delta interval:(NSTimeInterval)interval async:(BOOL)async completion:(void (^)(void))completion {
    if (!task || delta < 0 || interval < 0) { return nil; }
    __block NSTimeInterval time = total;
    /// 队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    SYTimer * timer = [[SYTimer alloc] init];
    /// 创建定时器
    timer.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    /// 设置定时器时间
    dispatch_source_set_timer(timer.gcdTimer,
                              dispatch_time(DISPATCH_TIME_NOW, delta * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC,
                              0);
    /// 设置回调
    dispatch_source_set_event_handler(timer.gcdTimer, ^{
        task(time);
        if (time <= 0) {
            [self cancelTask:timer];
            !completion ? nil : completion();
        } else {
            time --;
        }
    });
    /// 启动定时器
    dispatch_resume(timer.gcdTimer);
    return timer;
}

+ (void)cancelTask:(SYTimer *)timer {
    if (!timer) { return; }
    dispatch_source_cancel(timer.gcdTimer);
}

@end
