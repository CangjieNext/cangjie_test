// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "B.h"
#import <Foundation/Foundation.h>

static void waitForFinalizer(double tl) {
    NSDate* start = [NSDate date];
    while ([A finalized] < 1 && fabs([start timeIntervalSinceNow]) < tl) {
        [B collect];
        [NSThread sleepForTimeInterval:0.05];
    }
}

int main(int argc, char** argv) {
    printf("objc: main\n");

    @autoreleasepool {
        printf("objc: readThrough = %lld\n", (long long)[B readThrough]);

        B* b = [[B alloc] init];
        printf("objc: b.tag = %lld\n", (long long)[b tag]);
    }

    waitForFinalizer(1.0);

    printf("objc: counter = %lld\n", (long long)[A counter]);
    printf("objc: finalized = %lld\n", (long long)[A finalized]);
    printf("objc: main end\n");
    return 0;
}
