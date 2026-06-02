// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>

typedef struct {
    int8_t a;
} DataI8;

typedef struct {
    int16_t a;
} DataI16;

typedef struct {
    int32_t a;
} DataI32;

typedef struct {
    int64_t a;
} DataI64;

DataI8 ProcessDataI8(DataI8 d)
{
    d.a += 10;
    return d;
}

DataI16 ProcessDataI16(DataI16 d)
{
    d.a += 10;
    return d;
}

DataI32 ProcessDataI32(DataI32 d)
{
    d.a += 10;
    return d;
}

DataI64 ProcessDataI64(DataI64 d)
{
    d.a += 10;
    return d;
}

void* GetProcessDataI8()
{
    return ProcessDataI8;
}
void* GetProcessDataI16()
{
    return ProcessDataI16;
}
void* GetProcessDataI32()
{
    return ProcessDataI32;
}
void* GetProcessDataI64()
{
    return ProcessDataI64;
}
