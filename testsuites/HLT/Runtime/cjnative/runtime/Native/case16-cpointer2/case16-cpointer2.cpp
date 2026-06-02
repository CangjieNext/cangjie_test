/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <cstdint>
#include <cstdio>
#include <cstdlib>

extern "C" {

void func() {
    printf("from func name call.\n");
}

float* getCPtrInt()
{
    float* a = (float*)malloc(sizeof(float) * 3);
    a[0] = 3.4f;
    a[1] = 3.5f;
    a[2] = 3.6f;
    printf("pass to CJ a: %f\n", *a);
    return a;
}

void* getCPtrVoid()
{
    int8_t* a = (int8_t*)malloc(sizeof(int8_t));
    *a = 127;
    printf("pass to CJ void a: %d\n", *a);
    return static_cast<void*>(a);
}

bool* getCPtrBool()
{
    bool* a = (bool*)malloc(sizeof(bool));
    *a = true;
    printf("pass to CJ bool a: %d\n", *a);
    return a;
}

char* getCPtrChar()
{
    char* a = (char*)malloc(sizeof(char));
    *a = 'a';
    printf("pass to CJ char a: %c\n", *a);
    return a;
}

int8_t* getCPtrInt8()
{
    int8_t* a = (int8_t*)malloc(sizeof(int8_t));
    *a = 127;
    printf("pass to CJ int8 a: %d\n", *a);
    return a;
}

int16_t* getCPtrInt16()
{
    int16_t* a = (int16_t*)malloc(sizeof(int16_t));
    *a = 32767;
    printf("pass to CJ int16 a: %d\n", *a);
    return a;
}

int32_t* getCPtrInt32()
{
    int32_t* a = (int32_t*)malloc(sizeof(int32_t));
    *a = 2147483647;
    printf("pass to CJ int32 a: %d\n", *a);
    return a;
}

int64_t* getCPtrInt64()
{
    int64_t* a = (int64_t*)malloc(sizeof(int64_t));
    *a = int64_t(9223372036854775807);
    printf("pass to CJ int64 a: %ld\n", *a);
    return a;
}

uint8_t* getCPtrUInt8()
{
    uint8_t* a = (uint8_t*)malloc(sizeof(uint8_t));
    *a = 127 * 2 + 1;
    printf("pass to CJ uint8 a: %d\n", *a);
    return a;
}

uint16_t* getCPtrUInt16()
{
    uint16_t* a = (uint16_t*)malloc(sizeof(uint16_t));
    *a = 32767 * 2 + 1;
    printf("pass to CJ uint16 a: %d\n", *a);
    return a;
}

uint32_t* getCPtrUInt32()
{
    uint32_t* a = (uint32_t*)malloc(sizeof(uint32_t));
    *a = uint32_t(2147483647) * 2 + 1;
    printf("pass to CJ uint32 a: %u\n", *a);
    return a;
}

uint64_t* getCPtrUInt64()
{
    uint64_t* a = (uint64_t*)malloc(sizeof(uint64_t));
    *a = uint64_t(9223372036854775807) * 2 + 1;
    printf("pass to CJ uint64 a: %lu\n", *a);
    return a;
}

float* getCPtrFloat32()
{
    float* b = (float*)malloc(sizeof(float));
    *b = 3.8f;
    printf("pass to CJ float32 a: %f\n", *b);
    return b;
}

double* getCPtrFloat64()
{
    double* b = (double*)malloc(sizeof(double));
    *b = 3.8;
    printf("pass to CJ float64 a: %f\n", *b);
    return b;
}

void* passCPtrVoid(void* a)
{
    printf("get from CJ void.\n");
    return static_cast<void*>(a);
}

bool* passCPtrBool(bool* a)
{
    printf("get from CJ bool a: %d\n", *a);
    return a;
}

char* passCPtrChar(char* a)
{
    printf("get from CJ char a: %c\n", *a);
    return a;
}

int8_t* passCPtrInt8(int8_t* a)
{
    printf("get from CJ int8 a: %d\n", *a);
    return a;
}

int16_t* passCPtrInt16(int16_t* a)
{
    printf("get from CJ int16 a: %d\n", *a);
    return a;
}

int32_t* passCPtrInt32(int32_t* a)
{
    printf("get from CJ int32 a: %d\n", *a);
    return a;
}

int64_t* passCPtrInt64(int64_t* a)
{
    printf("get from CJ int64 a: %ld\n", *a);
    return a;
}

uint8_t* passCPtrUInt8(uint8_t* a)
{
    printf("get from CJ uint8 a: %d\n", *a);
    return a;
}

uint16_t* passCPtrUInt16(uint16_t* a)
{
    printf("get from CJ uint16 a: %d\n", *a);
    return a;
}

uint32_t* passCPtrUInt32(uint32_t* a)
{
    printf("get from uint32 a: %u\n", *a);
    return a;
}

uint64_t* passCPtrUInt64(uint64_t* a)
{
    printf("get from CJ uint64 a: %lu\n", *a);
    return a;
}

float* passCPtrFloat32(float* b)
{
    printf("get from CJ float32 a: %f\n", *b);
    return b;
}

double* passCPtrFloat64(double* b)
{
    printf("get from CJ float64 a: %f\n", *b);
    return b;
}

bool PassCPointerToC(const float* num)
{
    printf("get from CJ a: %f\n", *num);
    return true;
}

typedef struct {
    int x;
    uint16_t y;
    int16_t z;
    int32_t *ptr;
} BiggerStruct;

BiggerStruct* AllocCStruct()
{
    BiggerStruct* p = (BiggerStruct*)malloc(sizeof(BiggerStruct));
    p->x = 1;
    p->y = 2;
    p->z = 3;
    p->ptr = (int32_t*)malloc(sizeof(int32_t));
    *p->ptr = 5;
    printf("this is from c++.\n");
    printf("x : %d , y : %d , z : %d, ptr : %d\n", p->x, p->y, p->z, *p->ptr);
    return p;
}

void FreeCStruct(BiggerStruct* p)
{
    printf("free: x : %d , y : %d , z : %d, ptr : %d\n", p->x, p->y, p->z, *p->ptr);
    free(p->ptr);
    free(p);
}

BiggerStruct* GetFirstLevel(BiggerStruct** p)
{
    if (p == nullptr) {
        return nullptr;
    }
    return *p;
}
}
