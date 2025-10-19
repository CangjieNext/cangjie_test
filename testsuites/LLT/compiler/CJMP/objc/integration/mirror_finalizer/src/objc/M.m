// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

static int64_t _counter;
static NSLock* _locker;

+(int64_t)counter {
    return _counter;
}

+(NSLock*)locker {
    return _locker;
}

+(void)initialize {
    _locker = [[NSLock alloc] init];
    _counter = 0;
}

-(id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");

        while (YES) {
            if ([[M locker] tryLock]) {
                printf("objc: M.counter++\n");
                _counter++;
                [[M locker] unlock];
                break;
            }
        }
    }

    return self;
}

-(void)dealloc {
    printf("objc: [M dealloc]\n");

    while (YES) {
        if ([[M locker] tryLock]) {
            printf("objc: M.counter--\n");
            _counter--;
            
            [[M locker] unlock];
            break;
        }
    }
}

@end
