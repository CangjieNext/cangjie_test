// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

struct teststruct{
    int8_t i8;
    uint8_t ui8;
}; 

struct teststruct get_cstruct(struct teststruct (*ptr)(struct teststruct)){
    struct teststruct structtmp;
    structtmp.i8 = 0;
    structtmp.ui8 = 0;
    
    struct teststruct res = ptr(structtmp);
    printf("res.i8:%d \n", res.i8);
    printf("res.ui8:%d \n", res.ui8);
    return res;
}
