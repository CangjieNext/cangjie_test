/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <unistd.h>

volatile int ready;

void nativeFun()
{
    ready = 0;
    while (ready == 0) {
        sleep(2);
    }
}

void setReady()
{
    ready = 1;
}
