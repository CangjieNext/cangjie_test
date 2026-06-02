/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import "AImp.h"
#import "A.h"
#import "B.h"
#import "C.h"

void Test(NSObject<A>* a) {
	[a foo];
	[a goo :213 :435];
	printf("%d\n", [a koo] * 2);
	printf("%d\n", [a hoo :2800]);
}

int main()
{
    AImp* a = [[AImp alloc] init];
    B* b = [[B alloc] init];
    C* c = [[C alloc] init];
	Test(a);
    [b foo :a];
    [c foo :a];
}