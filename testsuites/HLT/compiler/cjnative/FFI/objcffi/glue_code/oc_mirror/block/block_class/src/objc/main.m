/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "M.h"
#import <Foundation/Foundation.h>
int main(int argc, char** argv) {
    @autoreleasepool {
        // 调用仓颉init，传入block实例
        A *a = [[A alloc] initWithP0: ^(M* m){printf("p0\n"); return m;}
                            p1: ^{printf("p1\n");}
                            p2: ^{printf("p2\n");}];
        [a foo];
        // OC定义的block
        void (^completionBlock)(void) = ^{
            printf("Block executed!\n");
        };
        // 将OC定义的block传参到cj侧
        [a f0: completionBlock];
        printf("in main\n");
        // 从cj侧传回来一个cj侧通过ObjCBlock实例化的block
        // 并在oc侧调用这个block
        [a A_instanceFunction: completionBlock]();
        // [A staticFunction: completionBlock]();

        a.A_instanceVariable0();
        a.A_instanceProperty0();
    }

    return 0;
}
