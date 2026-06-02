/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "Expr.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
	printf("Case 2:\n");
	printf("Expected result : 2, Actual : %lld\n", [[Expr Num:2] eval]); // 2
	printf("Expected result : 7, Actual : %lld\n", [[Expr Add:[Expr Num:2]:[Expr Num:5]] eval]); // 7
	printf("Expected result : 3, Actual : %lld\n", [[Expr Sub:[Expr Num:10]:[Expr Add:[Expr Num:2]:[Expr Num:5]]] eval]); // 3
    }
    return 0;
}
