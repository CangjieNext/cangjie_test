/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

struct MyStruct{
    int64_t n;
    int64_t m;
    int64_t k;
};

struct MyStruct AllocCStruct()
{
    struct MyStruct struct1;
    return struct1;
}

typedef struct MyStruct(*compare)(struct MyStruct);

struct MyStruct Max(struct MyStruct x) {
    x.n = x.n + 1;
    printf("x.n: %d\n", x.n);
    return x;
};

compare GetMaxFuncPtr()
{
    return &Max;
}
