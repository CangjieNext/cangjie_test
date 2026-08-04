/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

struct Data15 {
	int8_t a0;
	int16_t a1;
	int32_t a2;
	int64_t a3;
};

struct Data15* getptr(int8_t num1, int16_t num2, int32_t num3, int64_t num4) {
    struct Data15* ptr = (struct Data15*)malloc(sizeof(struct Data15));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;
    return ptr;
}

int32_t testfunc(struct Data15* param1, struct Data15* param2, struct Data15* param3, struct Data15* param4) {
    int32_t res = param1->a0 + param2->a1 + param3->a2 - param4->a3;
    return res;
}