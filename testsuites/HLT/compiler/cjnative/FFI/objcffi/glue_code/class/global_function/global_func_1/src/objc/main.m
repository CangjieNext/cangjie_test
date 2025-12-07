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
[a foo];
int result = global_func(233);
printf("oc result = %d\n", result);
}

return 0;
}
