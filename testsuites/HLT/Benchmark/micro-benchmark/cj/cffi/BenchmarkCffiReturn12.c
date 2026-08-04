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

struct Data24 {
	int8_t a0;
	int8_t a1;
	int16_t a2;
	int16_t a3;
	int32_t a4;
	int32_t a5;
	int64_t a6;
};

struct Data24* testfunc() {
	struct Data24* ptr = (struct Data24*)malloc(sizeof(struct Data24));
    ptr->a0 = 1;
    ptr->a1 = 2;
    ptr->a2 = 3;
    ptr->a3 = 4;
	ptr->a4 = 5;
    ptr->a5 = 6;
	ptr->a6 = 7;
    return ptr;
}