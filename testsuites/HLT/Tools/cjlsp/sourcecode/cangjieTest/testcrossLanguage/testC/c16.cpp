/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <cstdlib>
#include <cstring>
#include <stdint-gcc.h>

int8_t* get_cptrc(int8_t* a ){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    ptrtmp[0] = 48;
    ptrtmp[1] = 48;
    ptrtmp[2] = 48;
    if (a == nullptr) {
        std::cout << "a" << std::endl;
    }
    return ptrtmp;
}
