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
    while ([A collected] < 1 && fabs([start timeIntervalSinceNow]) < tl) {
        [B collect];
        [NSThread sleepForTimeInterval:0.05];
    }
}

int main(int argc, char** argv) {
    printf("objc: main\n");

    @autoreleasepool {
        B* b = [[B alloc] init];
        [b charge:41];
    }

    waitForFinalizer(1.0);

    printf("objc: collected = %lld\n", (long long)[A collected]);
    printf("objc: lastWeight = %lld\n", (long long)[A lastWeight]);
    printf("objc: main end\n");
    return 0;
}
