/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <cstdint>
#include <cstdio>

extern "C" {

uint64_t testfunc(uint64_t a, uint64_t b) {
    return a - b;
}

}