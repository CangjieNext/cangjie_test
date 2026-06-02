/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>

typedef struct teststruct2 {
    int8_t i8;
    uint8_t ui8;
} tst;

tst get_cstruct(tst p1, tst p2)
{
    struct teststruct2 structtmp;
    structtmp.i8 = 0;
    structtmp.ui8 = 0;
}
