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

typedef struct {
    int8_t a;
    int8_t b;
} DataI8I8;

typedef struct {
    int16_t a;
    int16_t b;
} DataI16I16;

typedef struct {
    int32_t a;
    int32_t b;
} DataI32I32;

typedef struct {
    int64_t a;
    int64_t b;
} DataI64I64;

DataI8I8 ProcessDataI8I8(DataI8I8 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI16I16 ProcessDataI16I16(DataI16I16 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI32I32 ProcessDataI32I32(DataI32I32 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI64I64 ProcessDataI64I64(DataI64I64 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

typedef struct {
    int8_t a;
    int16_t b;
} DataI8I16;

typedef struct {
    int8_t a;
    int32_t b;
} DataI8I32;

typedef struct {
    int8_t a;
    int64_t b;
} DataI8I64;

typedef struct {
    int16_t a;
    int32_t b;
} DataI16I32;

typedef struct {
    int16_t a;
    int64_t b;
} DataI16I64;

typedef struct {
    int32_t a;
    int64_t b;
} DataI32I64;

DataI8I16 ProcessDataI8I16(DataI8I16 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI8I32 ProcessDataI8I32(DataI8I32 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI8I64 ProcessDataI8I64(DataI8I64 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI16I32 ProcessDataI16I32(DataI16I32 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI16I64 ProcessDataI16I64(DataI16I64 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

DataI32I64 ProcessDataI32I64(DataI32I64 d)
{
    d.a += 10;
    d.b += 20;
    return d;
}

typedef struct {
    int8_t a;
    int8_t b;
    int8_t c;
} DataI8I8I8;

typedef struct {
    int16_t a;
    int16_t b;
    int16_t c;
} DataI16I16I16;

typedef struct {
    int32_t a;
    int32_t b;
    int32_t c;
} DataI32I32I32;

typedef struct {
    int64_t a;
    int64_t b;
    int64_t c;
} DataI64I64I64;

DataI8I8I8 ProcessDataI8I8I8(DataI8I8I8 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    return d;
}

DataI16I16I16 ProcessDataI16I16I16(DataI16I16I16 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    return d;
}

DataI32I32I32 ProcessDataI32I32I32(DataI32I32I32 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    return d;
}

DataI64I64I64 ProcessDataI64I64I64(DataI64I64I64 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    return d;
}

typedef struct {
    int8_t a;
    int8_t b;
    int8_t c;
    int8_t d;
} DataI8I8I8I8;

typedef struct {
    int16_t a;
    int16_t b;
    int16_t c;
    int16_t d;
} DataI16I16I16I16;

typedef struct {
    int32_t a;
    int32_t b;
    int32_t c;
    int32_t d;
} DataI32I32I32I32;

typedef struct {
    int64_t a;
    int64_t b;
    int64_t c;
    int64_t d;
} DataI64I64I64I64;

DataI8I8I8I8 ProcessDataI8I8I8I8(DataI8I8I8I8 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    d.d += 40;
    return d;
}

DataI16I16I16I16 ProcessDataI16I16I16I16(DataI16I16I16I16 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    d.d += 40;
    return d;
}

DataI32I32I32I32 ProcessDataI32I32I32I32(DataI32I32I32I32 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    d.d += 40;
    return d;
}

DataI64I64I64I64 ProcessDataI64I64I64I64(DataI64I64I64I64 d)
{
    d.a += 10;
    d.b += 20;
    d.c += 30;
    d.d += 40;
    return d;
}

typedef struct {
    float a;
} DataF32;

typedef struct {
    double a;
} DataF64;

typedef struct {
    float a;
    float b;
} DataF32F32;

typedef struct {
    double a;
    double b;
} DataF64F64;

typedef struct {
    float a;
    float b;
    float c;
} DataF32F32F32;

typedef struct {
    double a;
    double b;
    double c;
} DataF64F64F64;

typedef struct {
    float a;
    float b;
    float c;
    float d;
} DataF32F32F32F32;

typedef struct {
    float a;
    float b;
    float c;
    float d;
    float e;
} DataF32F32F32F32F32;

DataF32 ProcessDataF32(DataF32 d)
{
    d.a += 10.0;
    return d;
}

DataF64 ProcessDataF64(DataF64 d)
{
    d.a += 10.0;
    return d;
}

DataF32F32 ProcessDataF32F32(DataF32F32 d)
{
    d.a += 10.0;
    d.b += 20.0;
    return d;
}

DataF64F64 ProcessDataF64F64(DataF64F64 d)
{
    d.a += 10.0;
    d.b += 20.0;
    return d;
}

DataF32F32F32 ProcessDataF32F32F32(DataF32F32F32 d)
{
    d.a += 10.0;
    d.b += 20.0;
    d.c += 30.0;
    return d;
}

DataF64F64F64 ProcessDataF64F64F64(DataF64F64F64 d)
{
    d.a += 10.0;
    d.b += 20.0;
    d.c += 30.0;
    return d;
}

DataF32F32F32F32 ProcessDataF32F32F32F32(DataF32F32F32F32 d)
{
    d.a += 10.0;
    d.b += 20.0;
    d.c += 30.0;
    d.d += 40.0;
    return d;
}

DataF32F32F32F32F32 ProcessDataF32F32F32F32F32(DataF32F32F32F32F32 d)
{
    d.a += 10.0;
    d.b += 20.0;
    d.c += 30.0;
    d.d += 40.0;
    d.e += 50.0;
    return d;
}

typedef struct {
    int8_t a;
    float b;
} DataI8F32;

typedef struct {
    int32_t a;
    float b;
} DataI32F32;

typedef struct {
    int8_t a;
    double b;
} DataI8F64;

typedef struct {
    int32_t a;
    double b;
} DataI32F64;

typedef struct {
    int8_t a;
    float b;
    int8_t c;
    float d;
} DataI8F32I8F32;

typedef struct {
    int32_t a;
    float b;
    int32_t c;
    float d;
} DataI32F32I32F32;

typedef struct {
    int8_t a;
    double b;
    int8_t c;
    double d;
} DataI8F64I8F64;

typedef struct {
    int32_t a;
    double b;
    int32_t c;
    double d;
} DataI32F64I32F64;

DataI8F32 ProcessDataI8F32(DataI8F32 d)
{
    d.a += 10;
    d.b += 20.0;
    return d;
}

DataI32F32 ProcessDataI32F32(DataI32F32 d)
{
    d.a += 10;
    d.b += 20.0;
    return d;
}

DataI8F64 ProcessDataI8F64(DataI8F64 d)
{
    d.a += 10;
    d.b += 20.0;
    return d;
}

DataI32F64 ProcessDataI32F64(DataI32F64 d)
{
    d.a += 10;
    d.b += 20.0;
    return d;
}

DataI8F32I8F32 ProcessDataI8F32I8F32(DataI8F32I8F32 d)
{
    d.a += 10;
    d.b += 20.0;
    d.c += 30;
    d.d += 40.0;
    return d;
}

DataI32F32I32F32 ProcessDataI32F32I32F32(DataI32F32I32F32 d)
{
    d.a += 10;
    d.b += 20.0;
    d.c += 30;
    d.d += 40.0;
    return d;
}

DataI8F64I8F64 ProcessDataI8F64I8F64(DataI8F64I8F64 d)
{
    d.a += 10;
    d.b += 20.0;
    d.c += 30;
    d.d += 40.0;
    return d;
}

DataI32F64I32F64 ProcessDataI32F64I32F64(DataI32F64I32F64 d)
{
    d.a += 10;
    d.b += 20.0;
    d.c += 30;
    d.d += 40.0;
    return d;
}
