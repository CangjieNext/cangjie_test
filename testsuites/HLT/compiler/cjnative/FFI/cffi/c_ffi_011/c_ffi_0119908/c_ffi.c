/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int8_t* get_cptr1(int8_t*(*ptr1)(int8_t*) ){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 47;
    ptrtmp[1] = 47;
    ptrtmp[2] = 47;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

int8_t* get_cptr2(int8_t*(*ptr1)(int8_t*), int8_t*(*ptr2)(int8_t*)){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 48;
    ptrtmp[1] = 48;
    ptrtmp[2] = 48;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

int8_t* get_cptr3(int8_t*(*ptr1)(int8_t*), int8_t*(*ptr2)(int8_t*)){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 48;
    ptrtmp[1] = 48;
    ptrtmp[2] = 48;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

int8_t* get_cptr4(int8_t*(*ptr1)(int8_t*), int8_t*(*ptr2)(int8_t*), int8_t*(*ptr3)(int8_t*)){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 49;
    ptrtmp[1] = 49;
    ptrtmp[2] = 49;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

int8_t* get_cptr5(int8_t*(*ptr1)(int8_t*), int8_t*(*ptr2)(int8_t*), int8_t*(*ptr3)(int8_t*)){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 49;
    ptrtmp[1] = 49;
    ptrtmp[2] = 49;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

int8_t* get_cptr6(int8_t*(*ptr1)(int8_t*), int8_t*(*ptr2)(int8_t*), int8_t*(*ptr3)(int8_t*)){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    if (ptrtmp == NULL) {
        return NULL;
    }
    ptrtmp[0] = 49;
    ptrtmp[1] = 49;
    ptrtmp[2] = 49;
    int8_t* res = ptr1(ptrtmp);
    return res;
}

