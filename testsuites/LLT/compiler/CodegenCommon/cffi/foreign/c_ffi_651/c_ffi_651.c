// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


#include "stdint.h"

__int8_t func_i8(__int8_t a) {
    printf("func_i8: %d\n", a);
    return a;
}

__uint8_t func_u8(__uint8_t a) {
    printf("func_u8: %d\n", a);
    return a;
}

__int16_t func_i16(__int16_t a) {
    printf("func_i16: %d\n", a);
    return a;
}

__uint16_t func_u16(__uint16_t a) {
    printf("func_u16: %d\n", a);
    return a;
}