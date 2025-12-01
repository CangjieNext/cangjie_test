/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "G.h"
#import <Foundation/Foundation.h>
int main(int argc, char** argv) {
@autoreleasepool {
A* a= [[A alloc] init];
printf("in objc main, %d\n", 114514);
[a mFoo];
[a pFoo];

M *m = [[M alloc] init];
[a aFoo0: m];
[a aFoo0: nil];

printf("global_func() = %d\n", global_func());
}

return 0;
}
