// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Test.h"
#import <Foundation/Foundation.h>

BOOL checkTrue()    { return true;  }
BOOL checkFalse()   { return false; }

int main(int argc, char** argv) {
    @autoreleasepool {
        Test* test = [[Test alloc] init];
        [test cFuncTestObjCToCj:checkTrue   ]; // f() passed from ObjC called, true
        [test cFuncTestObjCToCj:checkFalse  ]; // f() passed from ObjC called, false
        [test cFuncTestCjToObjC];              // testFunc() passed to ObjC called, i = 42
    }
    return 0;
}
