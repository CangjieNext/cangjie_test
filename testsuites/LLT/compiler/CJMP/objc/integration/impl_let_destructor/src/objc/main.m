// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "B.h"
#import "Test.h"
#import <Foundation/Foundation.h>

/*

*/

int main(int argc, char** argv) {
    @autoreleasepool {
        Test* test = [[Test alloc] init];
        A* a = [[A alloc] init:5];
        B* b = [[B alloc] init];
        [test letTest:a];
        [test letTest:b];
    }
    return 0;
}
