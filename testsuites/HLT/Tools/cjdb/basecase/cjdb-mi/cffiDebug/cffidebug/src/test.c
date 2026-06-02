/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>

int32_t cfoo_2()
{
    int a = 3;
    char b = 'c';
    float c = 0.618;
    double d = 0.9999999;
    printf("cfoo_2\n");
    return d;
}


int32_t cfoo_1()
{
    int a = 3;
    char b = 'c';
    float c = 0.618;
    double d = 0.9999999;
    double balance[5] = {1000.0, 2.0, 3.4, 7.0, 50.0};
    cfoo_2();
    printf("cfoo_1\n");
    return 0;
}


typedef int32_t (*cfunc_t)();

int32_t run_callback(cfunc_t cb)
{
    printf("running callback\n");
    return cb();
}