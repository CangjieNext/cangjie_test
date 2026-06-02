/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>

typedef struct{
    long long a;
} MyStruct;

MyStruct* AllocCStruct()
{
    MyStruct* p = malloc(sizeof(MyStruct));
    return p;
}

typedef MyStruct*(*compare)(MyStruct*);

MyStruct* Max(MyStruct* x) {
    x->a = x->a + 1;
    return x;
};

compare GetMaxFuncPtr()
{
    MyStruct* (*ret)(MyStruct*) = &Max;
    return ret;
}
