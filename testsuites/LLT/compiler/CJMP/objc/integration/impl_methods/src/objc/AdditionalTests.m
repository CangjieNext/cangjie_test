// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Factory.h"
#import "Derived.h"

@interface StaticTests: NSObject
@end

@implementation StaticTests
- (void)smoke {
    Factory* factory = [[Factory alloc] init];
    NSAssert([Derived static1WithArg: [factory boxWith: 1]] == -1, @"");
    NSAssert([Derived static2WithArg0: [factory boxWith: 1] 
                      withArg1: [factory boxWith: 4]] == -5, @"");
    NSAssert([Derived static3WithArg0: [factory boxWith: 1] 
                      withArg1: [factory boxWith: 4] 
                      withArg2: [factory boxWith: 6]] == -6, @"");
}
@end

int objcMain() {
    [[[StaticTests alloc] init] smoke];
    return 0;
}
