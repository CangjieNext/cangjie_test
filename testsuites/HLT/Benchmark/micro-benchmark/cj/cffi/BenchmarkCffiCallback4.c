/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdint.h>

typedef void (*callback)();
void run(callback cb1,callback cb2,callback cb3,callback cb4,
         callback cb5,callback cb6,callback cb7,callback cb8,
         callback cb9,callback cb10,callback cb11,callback cb12,
         callback cb13,callback cb14,callback cb15,callback cb16){
    cb1();
    cb2();
    cb3();
    cb4();
    cb5();
    cb6();
    cb7();
    cb8();
    cb9();
    cb10();
    cb11();
    cb12();
    cb13();
    cb14();
    cb15();
    cb16();
};