# SYTimer

[![CI Status](https://img.shields.io/travis/YangShi123/SYTimer.svg?style=flat)](https://travis-ci.org/YangShi123/SYTimer)
[![License](https://img.shields.io/cocoapods/l/SYTimer.svg?style=flat)](https://cocoapods.org/pods/SYTimer)
[![Platform](https://img.shields.io/cocoapods/p/SYTimer.svg?style=flat)](https://cocoapods.org/pods/SYTimer)

## Example

定时器

```
[SYTimer excuteTask:^{
       
    } delta:0 interval:1 repeats:YES async:YES];
```

倒计时

```
[SYTimer excuteReverseTask:^(NSTimeInterval remain) {
       
    } total:10 delta:0 interval:1 async:YES completion:^{
       
    }];
```

## Author

YangShi123, shiyawn@163.com

## License

SYTimer is available under the MIT license. See the LICENSE file for more info.
