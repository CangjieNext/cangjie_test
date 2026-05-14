// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "GCMarker.h"
#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        printf("objc: test with NSDictionary\n");
        NSDictionary *dict = @{
            @"first": @1,
            @"second": @-2,
            @"": @100500
        };
        [A testWithDict: dict];

        printf("objc: wait for Cangjie GC after test with NSDictionary\n");
        while (YES) {
          if ([[GCMarker locker] tryLock]) {
            if ([GCMarker counter] == 0) {
                [[GCMarker locker] unlock];
                printf("objc: Cangjie GC cleared objects\n");
                break;
            }
            [[GCMarker locker] unlock];
            [NSThread sleepForTimeInterval:0.05];            
          }
        }

        printf("objc: [A testHashMap]\n");
        [A testHashMap];

        printf("objc: wait for Cangjie GC after test HashMap\n");
        while (YES) {
          if ([[GCMarker locker] tryLock]) {
            if ([GCMarker counter] == 0) {
                [[GCMarker locker] unlock];
                printf("objc: Cangjie GC cleared objects\n");
                break;
            }
            [[GCMarker locker] unlock];
            [NSThread sleepForTimeInterval:0.05];            
          }
        }
    }
    return 0;
}

