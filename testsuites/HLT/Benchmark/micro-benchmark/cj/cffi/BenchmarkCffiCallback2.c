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
void run(callback cb1,callback cb2,callback cb3,callback cb4){
    cb1();
    cb2();
    cb3();
    cb4();
};