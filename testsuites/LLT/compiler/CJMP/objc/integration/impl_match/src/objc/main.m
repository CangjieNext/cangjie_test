// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "B.h"
#import "C.h"
#import "D.h"
#import "BaseProto.h"
#import "Test.h"
#import <Foundation/Foundation.h>

/*

*/

int main(int argc, char** argv) {
    @autoreleasepool {
        Test* test = [[Test alloc] init];
        A* a5 = [[A alloc] init:5];
        A* a0 = [[A alloc] init:0];
        A* a9 = [[A alloc] init:9];
        C* c  = [[C alloc] init];
        B* b  = [[B alloc] init];
        D* d  = [[D alloc] init];

        Base* base = [[Base alloc] init];

        [test matchTest:a5];    // A.test() called, i = 5
        [test matchTest:a0];    // A.test() called, i = 0
        [test matchTest:a9];    // A, where i not 5 or 0

        [test matchTest:c];     // identify() called
        [test matchTest:b];     // B

        [test matchTest:base];  // ObjCId

        [test nestedMatch:d ];  // m is D
        [test nestedMatch:a5];  // m is A but not D
    }
    return 0;
}
