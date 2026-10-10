// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

static void waitForFinalizer(double tl) {
    NSDate* start = [NSDate date];
    while ([A count] < 2 && fabs([start timeIntervalSinceNow]) < tl) {
        [A collect];
        [NSThread sleepForTimeInterval:0.05];
    }
}

int main(int argc, char** argv) {
    printf("objc: main\n");

    @autoreleasepool {
        A* a = [[A alloc] init];
        [a touchStatics];
    }

    waitForFinalizer(1.0);

    printf("objc: count = %lld\n", (long long)[A count]);
    printf("objc: weight = %lld\n", (long long)[A weight]);
    printf("objc: main end\n");
    return 0;
}
