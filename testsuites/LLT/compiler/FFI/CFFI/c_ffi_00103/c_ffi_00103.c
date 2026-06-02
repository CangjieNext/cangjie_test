// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdlib.h>

typedef struct {
    long long x;
    long long y;
    long long z;
} BiggerStruct;

static BiggerStruct* p = NULL;

BiggerStruct** AllocCStruct()
{
    p = malloc(sizeof(BiggerStruct));
    p->x = 1;
    p->y = 2;
    p->z = 3;
    return &p;
}

void FreeCStruct(BiggerStruct* p)
{
    free(p);
}

BiggerStruct* GetFirstLevel(BiggerStruct** p)
{
    if (p == NULL) {
      return NULL;
    }
    return *p;
}
