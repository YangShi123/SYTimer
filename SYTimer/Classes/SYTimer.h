
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYTimer : NSObject

/// 定时器
/// @param task 任务
/// @param delta 延迟多久开始
/// @param interval 执行间隔时间
/// @param repeats 是否重复 为NO时 interval无效
/// @param async 是否异步

+ (instancetype)excuteTask:(void(^)(void))task
                     delta:(NSTimeInterval)delta
                  interval:(NSTimeInterval)interval
                   repeats:(BOOL)repeats
                     async:(BOOL)async;

/// 倒计时
/// @param task 任务
/// @param total 倒计时时间
/// @param delta 延迟多久开始
/// @param interval 执行间隔时间
/// @param async 是否异步
/// @param completion 完成任务回调
+ (instancetype)excuteReverseTask:(void(^)(NSTimeInterval remain))task
                            total:(NSTimeInterval)total
                            delta:(NSTimeInterval)delta
                         interval:(NSTimeInterval)interval
                            async:(BOOL)async
                       completion:(void(^)(void))completion;

/// 取消任务
/// @param timer 定时器实例对象
+ (void)cancelTask:(SYTimer *)timer;

@end

NS_ASSUME_NONNULL_END
