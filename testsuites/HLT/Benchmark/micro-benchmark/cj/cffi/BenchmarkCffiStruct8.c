/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdint.h>

struct Data64 {
	int8_t a0;
	int8_t a1;
	int16_t a2;
	int16_t a3;
	int32_t a4;
	int32_t a5;
	int64_t a6;
	int64_t a7;
	int8_t a8;
	int8_t a9;
	int16_t a10;
	int16_t a11;
	int32_t a12;
	int32_t a13;
	int64_t a14;
	int64_t a15;
};

int32_t testfunc(struct Data64 param1, struct Data64 param2, struct Data64 param3, struct Data64 param4,
                 struct Data64 param5, struct Data64 param6, struct Data64 param7, struct Data64 param8,
				 struct Data64 param9, struct Data64 param10, struct Data64 param11, struct Data64 param12,
				 struct Data64 param13, struct Data64 param14, struct Data64 param15, struct Data64 param16) {
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8 + param5.a0 + param6.a2 + param7.a4 + param8.a8 -
	              param9.a0 - param10.a2 - param11.a4 - param12.a8 - param13.a0 - param14.a2 - param15.a4 + param16.a8;
    return res;
}
