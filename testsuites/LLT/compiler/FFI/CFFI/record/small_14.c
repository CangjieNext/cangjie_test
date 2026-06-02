// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>

typedef struct {
    int8_t i8;
    uint8_t ui8;
} Small;

Small GetCStruct(Small (*ptr)(Small))
{
    Small tmp;
    tmp.i8 = 0;
    tmp.ui8 = 0;

    Small res = ptr(tmp);
    return res;
}
