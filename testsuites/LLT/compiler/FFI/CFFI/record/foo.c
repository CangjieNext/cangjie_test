// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

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

DataI8 PassInt8ToDataI8(signed char v) {
    printf("PassInt8ToDataI8: ");
    printf("%d\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassInt16ToDataI8(short v) {
    printf("PassInt16ToDataI8: ");
    printf("%d\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassInt32ToDataI8(int v) {
    printf("PassInt32ToDataI8: ");
    printf("%d\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassInt64ToDataI8(long long v) {
    printf("PassInt64ToDataI8: ");
    printf("%lld\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassUInt8ToDataI8(unsigned char v) {
    printf("PassUInt8ToDataI8: ");
    printf("%u\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassUInt16ToDataI8(unsigned short v) {
    printf("PassUInt16ToDataI8: ");
    printf("%u\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassUInt32ToDataI8(unsigned int v) {
    printf("PassUInt32ToDataI8: ");
    printf("%u\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassUInt64ToDataI8(unsigned long long v) {
    printf("PassUInt64ToDataI8: ");
    printf("%llu\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassFloat32ToDataI8(float v) {
    printf("PassFloat32ToDataI8: ");
    printf("%f\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassFloat64ToDataI8(double v) {
    printf("PassFloat64ToDataI8: ");
    printf("%f\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI8 PassBoolToDataI8(bool v) {
    printf("PassBoolToDataI8: ");
    printf("%d\n", v);
    DataI8 s;
    s.a = (int8_t)v;
    return s;
}

DataI16 PassInt8ToDataI16(signed char v) {
    printf("PassInt8ToDataI16: ");
    printf("%d\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassInt16ToDataI16(short v) {
    printf("PassInt16ToDataI16: ");
    printf("%d\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassInt32ToDataI16(int v) {
    printf("PassInt32ToDataI16: ");
    printf("%d\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassInt64ToDataI16(long long v) {
    printf("PassInt64ToDataI16: ");
    printf("%lld\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassUInt8ToDataI16(unsigned char v) {
    printf("PassUInt8ToDataI16: ");
    printf("%u\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassUInt16ToDataI16(unsigned short v) {
    printf("PassUInt16ToDataI16: ");
    printf("%u\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassUInt32ToDataI16(unsigned int v) {
    printf("PassUInt32ToDataI16: ");
    printf("%u\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassUInt64ToDataI16(unsigned long long v) {
    printf("PassUInt64ToDataI16: ");
    printf("%llu\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassFloat32ToDataI16(float v) {
    printf("PassFloat32ToDataI16: ");
    printf("%f\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassFloat64ToDataI16(double v) {
    printf("PassFloat64ToDataI16: ");
    printf("%f\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI16 PassBoolToDataI16(bool v) {
    printf("PassBoolToDataI16: ");
    printf("%d\n", v);
    DataI16 s;
    s.a = (int16_t)v;
    return s;
}

DataI32 PassInt8ToDataI32(signed char v) {
    printf("PassInt8ToDataI32: ");
    printf("%d\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassInt16ToDataI32(short v) {
    printf("PassInt16ToDataI32: ");
    printf("%d\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassInt32ToDataI32(int v) {
    printf("PassInt32ToDataI32: ");
    printf("%d\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassInt64ToDataI32(long long v) {
    printf("PassInt64ToDataI32: ");
    printf("%lld\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassUInt8ToDataI32(unsigned char v) {
    printf("PassUInt8ToDataI32: ");
    printf("%u\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassUInt16ToDataI32(unsigned short v) {
    printf("PassUInt16ToDataI32: ");
    printf("%u\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassUInt32ToDataI32(unsigned int v) {
    printf("PassUInt32ToDataI32: ");
    printf("%u\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassUInt64ToDataI32(unsigned long long v) {
    printf("PassUInt64ToDataI32: ");
    printf("%llu\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassFloat32ToDataI32(float v) {
    printf("PassFloat32ToDataI32: ");
    printf("%f\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassFloat64ToDataI32(double v) {
    printf("PassFloat64ToDataI32: ");
    printf("%f\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI32 PassBoolToDataI32(bool v) {
    printf("PassBoolToDataI32: ");
    printf("%d\n", v);
    DataI32 s;
    s.a = (int32_t)v;
    return s;
}

DataI64 PassInt8ToDataI64(signed char v) {
    printf("PassInt8ToDataI64: ");
    printf("%d\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassInt16ToDataI64(short v) {
    printf("PassInt16ToDataI64: ");
    printf("%d\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassInt32ToDataI64(int v) {
    printf("PassInt32ToDataI64: ");
    printf("%d\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassInt64ToDataI64(long long v) {
    printf("PassInt64ToDataI64: ");
    printf("%lld\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassUInt8ToDataI64(unsigned char v) {
    printf("PassUInt8ToDataI64: ");
    printf("%u\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassUInt16ToDataI64(unsigned short v) {
    printf("PassUInt16ToDataI64: ");
    printf("%u\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassUInt32ToDataI64(unsigned int v) {
    printf("PassUInt32ToDataI64: ");
    printf("%u\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassUInt64ToDataI64(unsigned long long v) {
    printf("PassUInt64ToDataI64: ");
    printf("%llu\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassFloat32ToDataI64(float v) {
    printf("PassFloat32ToDataI64: ");
    printf("%f\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassFloat64ToDataI64(double v) {
    printf("PassFloat64ToDataI64: ");
    printf("%f\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI64 PassBoolToDataI64(bool v) {
    printf("PassBoolToDataI64: ");
    printf("%d\n", v);
    DataI64 s;
    s.a = (int64_t)v;
    return s;
}

DataI8I8 PassInt8ToDataI8I8(signed char v) {
    printf("PassInt8ToDataI8I8: ");
    printf("%d\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassInt16ToDataI8I8(short v) {
    printf("PassInt16ToDataI8I8: ");
    printf("%d\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassInt32ToDataI8I8(int v) {
    printf("PassInt32ToDataI8I8: ");
    printf("%d\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassInt64ToDataI8I8(long long v) {
    printf("PassInt64ToDataI8I8: ");
    printf("%lld\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassUInt8ToDataI8I8(unsigned char v) {
    printf("PassUInt8ToDataI8I8: ");
    printf("%u\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassUInt16ToDataI8I8(unsigned short v) {
    printf("PassUInt16ToDataI8I8: ");
    printf("%u\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassUInt32ToDataI8I8(unsigned int v) {
    printf("PassUInt32ToDataI8I8: ");
    printf("%u\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassUInt64ToDataI8I8(unsigned long long v) {
    printf("PassUInt64ToDataI8I8: ");
    printf("%llu\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassFloat32ToDataI8I8(float v) {
    printf("PassFloat32ToDataI8I8: ");
    printf("%f\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassFloat64ToDataI8I8(double v) {
    printf("PassFloat64ToDataI8I8: ");
    printf("%f\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI8I8 PassBoolToDataI8I8(bool v) {
    printf("PassBoolToDataI8I8: ");
    printf("%d\n", v);
    DataI8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    return s;
}

DataI16I16 PassInt8ToDataI16I16(signed char v) {
    printf("PassInt8ToDataI16I16: ");
    printf("%d\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassInt16ToDataI16I16(short v) {
    printf("PassInt16ToDataI16I16: ");
    printf("%d\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassInt32ToDataI16I16(int v) {
    printf("PassInt32ToDataI16I16: ");
    printf("%d\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassInt64ToDataI16I16(long long v) {
    printf("PassInt64ToDataI16I16: ");
    printf("%lld\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassUInt8ToDataI16I16(unsigned char v) {
    printf("PassUInt8ToDataI16I16: ");
    printf("%u\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassUInt16ToDataI16I16(unsigned short v) {
    printf("PassUInt16ToDataI16I16: ");
    printf("%u\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassUInt32ToDataI16I16(unsigned int v) {
    printf("PassUInt32ToDataI16I16: ");
    printf("%u\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassUInt64ToDataI16I16(unsigned long long v) {
    printf("PassUInt64ToDataI16I16: ");
    printf("%llu\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassFloat32ToDataI16I16(float v) {
    printf("PassFloat32ToDataI16I16: ");
    printf("%f\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassFloat64ToDataI16I16(double v) {
    printf("PassFloat64ToDataI16I16: ");
    printf("%f\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI16I16 PassBoolToDataI16I16(bool v) {
    printf("PassBoolToDataI16I16: ");
    printf("%d\n", v);
    DataI16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI32I32 PassInt8ToDataI32I32(signed char v) {
    printf("PassInt8ToDataI32I32: ");
    printf("%d\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassInt16ToDataI32I32(short v) {
    printf("PassInt16ToDataI32I32: ");
    printf("%d\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassInt32ToDataI32I32(int v) {
    printf("PassInt32ToDataI32I32: ");
    printf("%d\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassInt64ToDataI32I32(long long v) {
    printf("PassInt64ToDataI32I32: ");
    printf("%lld\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassUInt8ToDataI32I32(unsigned char v) {
    printf("PassUInt8ToDataI32I32: ");
    printf("%u\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassUInt16ToDataI32I32(unsigned short v) {
    printf("PassUInt16ToDataI32I32: ");
    printf("%u\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassUInt32ToDataI32I32(unsigned int v) {
    printf("PassUInt32ToDataI32I32: ");
    printf("%u\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassUInt64ToDataI32I32(unsigned long long v) {
    printf("PassUInt64ToDataI32I32: ");
    printf("%llu\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassFloat32ToDataI32I32(float v) {
    printf("PassFloat32ToDataI32I32: ");
    printf("%f\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassFloat64ToDataI32I32(double v) {
    printf("PassFloat64ToDataI32I32: ");
    printf("%f\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI32I32 PassBoolToDataI32I32(bool v) {
    printf("PassBoolToDataI32I32: ");
    printf("%d\n", v);
    DataI32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI64I64 PassInt8ToDataI64I64(signed char v) {
    printf("PassInt8ToDataI64I64: ");
    printf("%d\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassInt16ToDataI64I64(short v) {
    printf("PassInt16ToDataI64I64: ");
    printf("%d\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassInt32ToDataI64I64(int v) {
    printf("PassInt32ToDataI64I64: ");
    printf("%d\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassInt64ToDataI64I64(long long v) {
    printf("PassInt64ToDataI64I64: ");
    printf("%lld\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassUInt8ToDataI64I64(unsigned char v) {
    printf("PassUInt8ToDataI64I64: ");
    printf("%u\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassUInt16ToDataI64I64(unsigned short v) {
    printf("PassUInt16ToDataI64I64: ");
    printf("%u\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassUInt32ToDataI64I64(unsigned int v) {
    printf("PassUInt32ToDataI64I64: ");
    printf("%u\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassUInt64ToDataI64I64(unsigned long long v) {
    printf("PassUInt64ToDataI64I64: ");
    printf("%llu\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassFloat32ToDataI64I64(float v) {
    printf("PassFloat32ToDataI64I64: ");
    printf("%f\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassFloat64ToDataI64I64(double v) {
    printf("PassFloat64ToDataI64I64: ");
    printf("%f\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI64I64 PassBoolToDataI64I64(bool v) {
    printf("PassBoolToDataI64I64: ");
    printf("%d\n", v);
    DataI64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I16 PassInt8ToDataI8I16(signed char v) {
    printf("PassInt8ToDataI8I16: ");
    printf("%d\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassInt16ToDataI8I16(short v) {
    printf("PassInt16ToDataI8I16: ");
    printf("%d\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassInt32ToDataI8I16(int v) {
    printf("PassInt32ToDataI8I16: ");
    printf("%d\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassInt64ToDataI8I16(long long v) {
    printf("PassInt64ToDataI8I16: ");
    printf("%lld\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassUInt8ToDataI8I16(unsigned char v) {
    printf("PassUInt8ToDataI8I16: ");
    printf("%u\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassUInt16ToDataI8I16(unsigned short v) {
    printf("PassUInt16ToDataI8I16: ");
    printf("%u\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassUInt32ToDataI8I16(unsigned int v) {
    printf("PassUInt32ToDataI8I16: ");
    printf("%u\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassUInt64ToDataI8I16(unsigned long long v) {
    printf("PassUInt64ToDataI8I16: ");
    printf("%llu\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassFloat32ToDataI8I16(float v) {
    printf("PassFloat32ToDataI8I16: ");
    printf("%f\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassFloat64ToDataI8I16(double v) {
    printf("PassFloat64ToDataI8I16: ");
    printf("%f\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I16 PassBoolToDataI8I16(bool v) {
    printf("PassBoolToDataI8I16: ");
    printf("%d\n", v);
    DataI8I16 s;
    s.a = (int8_t)v;
    s.b = (int16_t)v;
    return s;
}

DataI8I32 PassInt8ToDataI8I32(signed char v) {
    printf("PassInt8ToDataI8I32: ");
    printf("%d\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassInt16ToDataI8I32(short v) {
    printf("PassInt16ToDataI8I32: ");
    printf("%d\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassInt32ToDataI8I32(int v) {
    printf("PassInt32ToDataI8I32: ");
    printf("%d\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassInt64ToDataI8I32(long long v) {
    printf("PassInt64ToDataI8I32: ");
    printf("%lld\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassUInt8ToDataI8I32(unsigned char v) {
    printf("PassUInt8ToDataI8I32: ");
    printf("%u\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassUInt16ToDataI8I32(unsigned short v) {
    printf("PassUInt16ToDataI8I32: ");
    printf("%u\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassUInt32ToDataI8I32(unsigned int v) {
    printf("PassUInt32ToDataI8I32: ");
    printf("%u\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassUInt64ToDataI8I32(unsigned long long v) {
    printf("PassUInt64ToDataI8I32: ");
    printf("%llu\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassFloat32ToDataI8I32(float v) {
    printf("PassFloat32ToDataI8I32: ");
    printf("%f\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassFloat64ToDataI8I32(double v) {
    printf("PassFloat64ToDataI8I32: ");
    printf("%f\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I32 PassBoolToDataI8I32(bool v) {
    printf("PassBoolToDataI8I32: ");
    printf("%d\n", v);
    DataI8I32 s;
    s.a = (int8_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI8I64 PassInt8ToDataI8I64(signed char v) {
    printf("PassInt8ToDataI8I64: ");
    printf("%d\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassInt16ToDataI8I64(short v) {
    printf("PassInt16ToDataI8I64: ");
    printf("%d\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassInt32ToDataI8I64(int v) {
    printf("PassInt32ToDataI8I64: ");
    printf("%d\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassInt64ToDataI8I64(long long v) {
    printf("PassInt64ToDataI8I64: ");
    printf("%lld\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassUInt8ToDataI8I64(unsigned char v) {
    printf("PassUInt8ToDataI8I64: ");
    printf("%u\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassUInt16ToDataI8I64(unsigned short v) {
    printf("PassUInt16ToDataI8I64: ");
    printf("%u\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassUInt32ToDataI8I64(unsigned int v) {
    printf("PassUInt32ToDataI8I64: ");
    printf("%u\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassUInt64ToDataI8I64(unsigned long long v) {
    printf("PassUInt64ToDataI8I64: ");
    printf("%llu\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassFloat32ToDataI8I64(float v) {
    printf("PassFloat32ToDataI8I64: ");
    printf("%f\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassFloat64ToDataI8I64(double v) {
    printf("PassFloat64ToDataI8I64: ");
    printf("%f\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I64 PassBoolToDataI8I64(bool v) {
    printf("PassBoolToDataI8I64: ");
    printf("%d\n", v);
    DataI8I64 s;
    s.a = (int8_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I32 PassInt8ToDataI16I32(signed char v) {
    printf("PassInt8ToDataI16I32: ");
    printf("%d\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassInt16ToDataI16I32(short v) {
    printf("PassInt16ToDataI16I32: ");
    printf("%d\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassInt32ToDataI16I32(int v) {
    printf("PassInt32ToDataI16I32: ");
    printf("%d\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassInt64ToDataI16I32(long long v) {
    printf("PassInt64ToDataI16I32: ");
    printf("%lld\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassUInt8ToDataI16I32(unsigned char v) {
    printf("PassUInt8ToDataI16I32: ");
    printf("%u\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassUInt16ToDataI16I32(unsigned short v) {
    printf("PassUInt16ToDataI16I32: ");
    printf("%u\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassUInt32ToDataI16I32(unsigned int v) {
    printf("PassUInt32ToDataI16I32: ");
    printf("%u\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassUInt64ToDataI16I32(unsigned long long v) {
    printf("PassUInt64ToDataI16I32: ");
    printf("%llu\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassFloat32ToDataI16I32(float v) {
    printf("PassFloat32ToDataI16I32: ");
    printf("%f\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassFloat64ToDataI16I32(double v) {
    printf("PassFloat64ToDataI16I32: ");
    printf("%f\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I32 PassBoolToDataI16I32(bool v) {
    printf("PassBoolToDataI16I32: ");
    printf("%d\n", v);
    DataI16I32 s;
    s.a = (int16_t)v;
    s.b = (int32_t)v;
    return s;
}

DataI16I64 PassInt8ToDataI16I64(signed char v) {
    printf("PassInt8ToDataI16I64: ");
    printf("%d\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassInt16ToDataI16I64(short v) {
    printf("PassInt16ToDataI16I64: ");
    printf("%d\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassInt32ToDataI16I64(int v) {
    printf("PassInt32ToDataI16I64: ");
    printf("%d\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassInt64ToDataI16I64(long long v) {
    printf("PassInt64ToDataI16I64: ");
    printf("%lld\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassUInt8ToDataI16I64(unsigned char v) {
    printf("PassUInt8ToDataI16I64: ");
    printf("%u\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassUInt16ToDataI16I64(unsigned short v) {
    printf("PassUInt16ToDataI16I64: ");
    printf("%u\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassUInt32ToDataI16I64(unsigned int v) {
    printf("PassUInt32ToDataI16I64: ");
    printf("%u\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassUInt64ToDataI16I64(unsigned long long v) {
    printf("PassUInt64ToDataI16I64: ");
    printf("%llu\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassFloat32ToDataI16I64(float v) {
    printf("PassFloat32ToDataI16I64: ");
    printf("%f\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassFloat64ToDataI16I64(double v) {
    printf("PassFloat64ToDataI16I64: ");
    printf("%f\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI16I64 PassBoolToDataI16I64(bool v) {
    printf("PassBoolToDataI16I64: ");
    printf("%d\n", v);
    DataI16I64 s;
    s.a = (int16_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassInt8ToDataI32I64(signed char v) {
    printf("PassInt8ToDataI32I64: ");
    printf("%d\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassInt16ToDataI32I64(short v) {
    printf("PassInt16ToDataI32I64: ");
    printf("%d\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassInt32ToDataI32I64(int v) {
    printf("PassInt32ToDataI32I64: ");
    printf("%d\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassInt64ToDataI32I64(long long v) {
    printf("PassInt64ToDataI32I64: ");
    printf("%lld\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassUInt8ToDataI32I64(unsigned char v) {
    printf("PassUInt8ToDataI32I64: ");
    printf("%u\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassUInt16ToDataI32I64(unsigned short v) {
    printf("PassUInt16ToDataI32I64: ");
    printf("%u\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassUInt32ToDataI32I64(unsigned int v) {
    printf("PassUInt32ToDataI32I64: ");
    printf("%u\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassUInt64ToDataI32I64(unsigned long long v) {
    printf("PassUInt64ToDataI32I64: ");
    printf("%llu\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassFloat32ToDataI32I64(float v) {
    printf("PassFloat32ToDataI32I64: ");
    printf("%f\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassFloat64ToDataI32I64(double v) {
    printf("PassFloat64ToDataI32I64: ");
    printf("%f\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI32I64 PassBoolToDataI32I64(bool v) {
    printf("PassBoolToDataI32I64: ");
    printf("%d\n", v);
    DataI32I64 s;
    s.a = (int32_t)v;
    s.b = (int64_t)v;
    return s;
}

DataI8I8I8 PassInt8ToDataI8I8I8(signed char v) {
    printf("PassInt8ToDataI8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassInt16ToDataI8I8I8(short v) {
    printf("PassInt16ToDataI8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassInt32ToDataI8I8I8(int v) {
    printf("PassInt32ToDataI8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassInt64ToDataI8I8I8(long long v) {
    printf("PassInt64ToDataI8I8I8: ");
    printf("%lld\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassUInt8ToDataI8I8I8(unsigned char v) {
    printf("PassUInt8ToDataI8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassUInt16ToDataI8I8I8(unsigned short v) {
    printf("PassUInt16ToDataI8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassUInt32ToDataI8I8I8(unsigned int v) {
    printf("PassUInt32ToDataI8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassUInt64ToDataI8I8I8(unsigned long long v) {
    printf("PassUInt64ToDataI8I8I8: ");
    printf("%llu\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassFloat32ToDataI8I8I8(float v) {
    printf("PassFloat32ToDataI8I8I8: ");
    printf("%f\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassFloat64ToDataI8I8I8(double v) {
    printf("PassFloat64ToDataI8I8I8: ");
    printf("%f\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI8I8I8 PassBoolToDataI8I8I8(bool v) {
    printf("PassBoolToDataI8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    return s;
}

DataI16I16I16 PassInt8ToDataI16I16I16(signed char v) {
    printf("PassInt8ToDataI16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassInt16ToDataI16I16I16(short v) {
    printf("PassInt16ToDataI16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassInt32ToDataI16I16I16(int v) {
    printf("PassInt32ToDataI16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassInt64ToDataI16I16I16(long long v) {
    printf("PassInt64ToDataI16I16I16: ");
    printf("%lld\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassUInt8ToDataI16I16I16(unsigned char v) {
    printf("PassUInt8ToDataI16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassUInt16ToDataI16I16I16(unsigned short v) {
    printf("PassUInt16ToDataI16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassUInt32ToDataI16I16I16(unsigned int v) {
    printf("PassUInt32ToDataI16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassUInt64ToDataI16I16I16(unsigned long long v) {
    printf("PassUInt64ToDataI16I16I16: ");
    printf("%llu\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassFloat32ToDataI16I16I16(float v) {
    printf("PassFloat32ToDataI16I16I16: ");
    printf("%f\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassFloat64ToDataI16I16I16(double v) {
    printf("PassFloat64ToDataI16I16I16: ");
    printf("%f\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI16I16I16 PassBoolToDataI16I16I16(bool v) {
    printf("PassBoolToDataI16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    return s;
}

DataI32I32I32 PassInt8ToDataI32I32I32(signed char v) {
    printf("PassInt8ToDataI32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassInt16ToDataI32I32I32(short v) {
    printf("PassInt16ToDataI32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassInt32ToDataI32I32I32(int v) {
    printf("PassInt32ToDataI32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassInt64ToDataI32I32I32(long long v) {
    printf("PassInt64ToDataI32I32I32: ");
    printf("%lld\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassUInt8ToDataI32I32I32(unsigned char v) {
    printf("PassUInt8ToDataI32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassUInt16ToDataI32I32I32(unsigned short v) {
    printf("PassUInt16ToDataI32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassUInt32ToDataI32I32I32(unsigned int v) {
    printf("PassUInt32ToDataI32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassUInt64ToDataI32I32I32(unsigned long long v) {
    printf("PassUInt64ToDataI32I32I32: ");
    printf("%llu\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassFloat32ToDataI32I32I32(float v) {
    printf("PassFloat32ToDataI32I32I32: ");
    printf("%f\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassFloat64ToDataI32I32I32(double v) {
    printf("PassFloat64ToDataI32I32I32: ");
    printf("%f\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI32I32I32 PassBoolToDataI32I32I32(bool v) {
    printf("PassBoolToDataI32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    return s;
}

DataI64I64I64 PassInt8ToDataI64I64I64(signed char v) {
    printf("PassInt8ToDataI64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassInt16ToDataI64I64I64(short v) {
    printf("PassInt16ToDataI64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassInt32ToDataI64I64I64(int v) {
    printf("PassInt32ToDataI64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassInt64ToDataI64I64I64(long long v) {
    printf("PassInt64ToDataI64I64I64: ");
    printf("%lld\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassUInt8ToDataI64I64I64(unsigned char v) {
    printf("PassUInt8ToDataI64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassUInt16ToDataI64I64I64(unsigned short v) {
    printf("PassUInt16ToDataI64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassUInt32ToDataI64I64I64(unsigned int v) {
    printf("PassUInt32ToDataI64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassUInt64ToDataI64I64I64(unsigned long long v) {
    printf("PassUInt64ToDataI64I64I64: ");
    printf("%llu\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassFloat32ToDataI64I64I64(float v) {
    printf("PassFloat32ToDataI64I64I64: ");
    printf("%f\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassFloat64ToDataI64I64I64(double v) {
    printf("PassFloat64ToDataI64I64I64: ");
    printf("%f\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI64I64I64 PassBoolToDataI64I64I64(bool v) {
    printf("PassBoolToDataI64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    return s;
}

DataI8I8I8I8 PassInt8ToDataI8I8I8I8(signed char v) {
    printf("PassInt8ToDataI8I8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassInt16ToDataI8I8I8I8(short v) {
    printf("PassInt16ToDataI8I8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassInt32ToDataI8I8I8I8(int v) {
    printf("PassInt32ToDataI8I8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassInt64ToDataI8I8I8I8(long long v) {
    printf("PassInt64ToDataI8I8I8I8: ");
    printf("%lld\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassUInt8ToDataI8I8I8I8(unsigned char v) {
    printf("PassUInt8ToDataI8I8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassUInt16ToDataI8I8I8I8(unsigned short v) {
    printf("PassUInt16ToDataI8I8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassUInt32ToDataI8I8I8I8(unsigned int v) {
    printf("PassUInt32ToDataI8I8I8I8: ");
    printf("%u\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassUInt64ToDataI8I8I8I8(unsigned long long v) {
    printf("PassUInt64ToDataI8I8I8I8: ");
    printf("%llu\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassFloat32ToDataI8I8I8I8(float v) {
    printf("PassFloat32ToDataI8I8I8I8: ");
    printf("%f\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassFloat64ToDataI8I8I8I8(double v) {
    printf("PassFloat64ToDataI8I8I8I8: ");
    printf("%f\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI8I8I8I8 PassBoolToDataI8I8I8I8(bool v) {
    printf("PassBoolToDataI8I8I8I8: ");
    printf("%d\n", v);
    DataI8I8I8I8 s;
    s.a = (int8_t)v;
    s.b = (int8_t)v;
    s.c = (int8_t)v;
    s.d = (int8_t)v;
    return s;
}

DataI16I16I16I16 PassInt8ToDataI16I16I16I16(signed char v) {
    printf("PassInt8ToDataI16I16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassInt16ToDataI16I16I16I16(short v) {
    printf("PassInt16ToDataI16I16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassInt32ToDataI16I16I16I16(int v) {
    printf("PassInt32ToDataI16I16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassInt64ToDataI16I16I16I16(long long v) {
    printf("PassInt64ToDataI16I16I16I16: ");
    printf("%lld\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassUInt8ToDataI16I16I16I16(unsigned char v) {
    printf("PassUInt8ToDataI16I16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassUInt16ToDataI16I16I16I16(unsigned short v) {
    printf("PassUInt16ToDataI16I16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassUInt32ToDataI16I16I16I16(unsigned int v) {
    printf("PassUInt32ToDataI16I16I16I16: ");
    printf("%u\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassUInt64ToDataI16I16I16I16(unsigned long long v) {
    printf("PassUInt64ToDataI16I16I16I16: ");
    printf("%llu\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassFloat32ToDataI16I16I16I16(float v) {
    printf("PassFloat32ToDataI16I16I16I16: ");
    printf("%f\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassFloat64ToDataI16I16I16I16(double v) {
    printf("PassFloat64ToDataI16I16I16I16: ");
    printf("%f\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI16I16I16I16 PassBoolToDataI16I16I16I16(bool v) {
    printf("PassBoolToDataI16I16I16I16: ");
    printf("%d\n", v);
    DataI16I16I16I16 s;
    s.a = (int16_t)v;
    s.b = (int16_t)v;
    s.c = (int16_t)v;
    s.d = (int16_t)v;
    return s;
}

DataI32I32I32I32 PassInt8ToDataI32I32I32I32(signed char v) {
    printf("PassInt8ToDataI32I32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassInt16ToDataI32I32I32I32(short v) {
    printf("PassInt16ToDataI32I32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassInt32ToDataI32I32I32I32(int v) {
    printf("PassInt32ToDataI32I32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassInt64ToDataI32I32I32I32(long long v) {
    printf("PassInt64ToDataI32I32I32I32: ");
    printf("%lld\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassUInt8ToDataI32I32I32I32(unsigned char v) {
    printf("PassUInt8ToDataI32I32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassUInt16ToDataI32I32I32I32(unsigned short v) {
    printf("PassUInt16ToDataI32I32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassUInt32ToDataI32I32I32I32(unsigned int v) {
    printf("PassUInt32ToDataI32I32I32I32: ");
    printf("%u\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassUInt64ToDataI32I32I32I32(unsigned long long v) {
    printf("PassUInt64ToDataI32I32I32I32: ");
    printf("%llu\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassFloat32ToDataI32I32I32I32(float v) {
    printf("PassFloat32ToDataI32I32I32I32: ");
    printf("%f\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassFloat64ToDataI32I32I32I32(double v) {
    printf("PassFloat64ToDataI32I32I32I32: ");
    printf("%f\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI32I32I32I32 PassBoolToDataI32I32I32I32(bool v) {
    printf("PassBoolToDataI32I32I32I32: ");
    printf("%d\n", v);
    DataI32I32I32I32 s;
    s.a = (int32_t)v;
    s.b = (int32_t)v;
    s.c = (int32_t)v;
    s.d = (int32_t)v;
    return s;
}

DataI64I64I64I64 PassInt8ToDataI64I64I64I64(signed char v) {
    printf("PassInt8ToDataI64I64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassInt16ToDataI64I64I64I64(short v) {
    printf("PassInt16ToDataI64I64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassInt32ToDataI64I64I64I64(int v) {
    printf("PassInt32ToDataI64I64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassInt64ToDataI64I64I64I64(long long v) {
    printf("PassInt64ToDataI64I64I64I64: ");
    printf("%lld\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassUInt8ToDataI64I64I64I64(unsigned char v) {
    printf("PassUInt8ToDataI64I64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassUInt16ToDataI64I64I64I64(unsigned short v) {
    printf("PassUInt16ToDataI64I64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassUInt32ToDataI64I64I64I64(unsigned int v) {
    printf("PassUInt32ToDataI64I64I64I64: ");
    printf("%u\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassUInt64ToDataI64I64I64I64(unsigned long long v) {
    printf("PassUInt64ToDataI64I64I64I64: ");
    printf("%llu\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassFloat32ToDataI64I64I64I64(float v) {
    printf("PassFloat32ToDataI64I64I64I64: ");
    printf("%f\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassFloat64ToDataI64I64I64I64(double v) {
    printf("PassFloat64ToDataI64I64I64I64: ");
    printf("%f\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataI64I64I64I64 PassBoolToDataI64I64I64I64(bool v) {
    printf("PassBoolToDataI64I64I64I64: ");
    printf("%d\n", v);
    DataI64I64I64I64 s;
    s.a = (int64_t)v;
    s.b = (int64_t)v;
    s.c = (int64_t)v;
    s.d = (int64_t)v;
    return s;
}

DataF32 PassInt8ToDataF32(signed char v) {
    printf("PassInt8ToDataF32: ");
    printf("%d\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassInt16ToDataF32(short v) {
    printf("PassInt16ToDataF32: ");
    printf("%d\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassInt32ToDataF32(int v) {
    printf("PassInt32ToDataF32: ");
    printf("%d\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassInt64ToDataF32(long long v) {
    printf("PassInt64ToDataF32: ");
    printf("%lld\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassUInt8ToDataF32(unsigned char v) {
    printf("PassUInt8ToDataF32: ");
    printf("%u\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassUInt16ToDataF32(unsigned short v) {
    printf("PassUInt16ToDataF32: ");
    printf("%u\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassUInt32ToDataF32(unsigned int v) {
    printf("PassUInt32ToDataF32: ");
    printf("%u\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassUInt64ToDataF32(unsigned long long v) {
    printf("PassUInt64ToDataF32: ");
    printf("%llu\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassFloat32ToDataF32(float v) {
    printf("PassFloat32ToDataF32: ");
    printf("%f\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassFloat64ToDataF32(double v) {
    printf("PassFloat64ToDataF32: ");
    printf("%f\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF32 PassBoolToDataF32(bool v) {
    printf("PassBoolToDataF32: ");
    printf("%d\n", v);
    DataF32 s;
    s.a = (float)v;
    return s;
}

DataF64 PassInt8ToDataF64(signed char v) {
    printf("PassInt8ToDataF64: ");
    printf("%d\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassInt16ToDataF64(short v) {
    printf("PassInt16ToDataF64: ");
    printf("%d\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassInt32ToDataF64(int v) {
    printf("PassInt32ToDataF64: ");
    printf("%d\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassInt64ToDataF64(long long v) {
    printf("PassInt64ToDataF64: ");
    printf("%lld\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassUInt8ToDataF64(unsigned char v) {
    printf("PassUInt8ToDataF64: ");
    printf("%u\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassUInt16ToDataF64(unsigned short v) {
    printf("PassUInt16ToDataF64: ");
    printf("%u\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassUInt32ToDataF64(unsigned int v) {
    printf("PassUInt32ToDataF64: ");
    printf("%u\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassUInt64ToDataF64(unsigned long long v) {
    printf("PassUInt64ToDataF64: ");
    printf("%llu\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassFloat32ToDataF64(float v) {
    printf("PassFloat32ToDataF64: ");
    printf("%f\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassFloat64ToDataF64(double v) {
    printf("PassFloat64ToDataF64: ");
    printf("%f\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF64 PassBoolToDataF64(bool v) {
    printf("PassBoolToDataF64: ");
    printf("%d\n", v);
    DataF64 s;
    s.a = (double)v;
    return s;
}

DataF32F32 PassInt8ToDataF32F32(signed char v) {
    printf("PassInt8ToDataF32F32: ");
    printf("%d\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassInt16ToDataF32F32(short v) {
    printf("PassInt16ToDataF32F32: ");
    printf("%d\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassInt32ToDataF32F32(int v) {
    printf("PassInt32ToDataF32F32: ");
    printf("%d\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassInt64ToDataF32F32(long long v) {
    printf("PassInt64ToDataF32F32: ");
    printf("%lld\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassUInt8ToDataF32F32(unsigned char v) {
    printf("PassUInt8ToDataF32F32: ");
    printf("%u\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassUInt16ToDataF32F32(unsigned short v) {
    printf("PassUInt16ToDataF32F32: ");
    printf("%u\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassUInt32ToDataF32F32(unsigned int v) {
    printf("PassUInt32ToDataF32F32: ");
    printf("%u\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassUInt64ToDataF32F32(unsigned long long v) {
    printf("PassUInt64ToDataF32F32: ");
    printf("%llu\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassFloat32ToDataF32F32(float v) {
    printf("PassFloat32ToDataF32F32: ");
    printf("%f\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassFloat64ToDataF32F32(double v) {
    printf("PassFloat64ToDataF32F32: ");
    printf("%f\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF32F32 PassBoolToDataF32F32(bool v) {
    printf("PassBoolToDataF32F32: ");
    printf("%d\n", v);
    DataF32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    return s;
}

DataF64F64 PassInt8ToDataF64F64(signed char v) {
    printf("PassInt8ToDataF64F64: ");
    printf("%d\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassInt16ToDataF64F64(short v) {
    printf("PassInt16ToDataF64F64: ");
    printf("%d\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassInt32ToDataF64F64(int v) {
    printf("PassInt32ToDataF64F64: ");
    printf("%d\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassInt64ToDataF64F64(long long v) {
    printf("PassInt64ToDataF64F64: ");
    printf("%lld\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassUInt8ToDataF64F64(unsigned char v) {
    printf("PassUInt8ToDataF64F64: ");
    printf("%u\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassUInt16ToDataF64F64(unsigned short v) {
    printf("PassUInt16ToDataF64F64: ");
    printf("%u\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassUInt32ToDataF64F64(unsigned int v) {
    printf("PassUInt32ToDataF64F64: ");
    printf("%u\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassUInt64ToDataF64F64(unsigned long long v) {
    printf("PassUInt64ToDataF64F64: ");
    printf("%llu\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassFloat32ToDataF64F64(float v) {
    printf("PassFloat32ToDataF64F64: ");
    printf("%f\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassFloat64ToDataF64F64(double v) {
    printf("PassFloat64ToDataF64F64: ");
    printf("%f\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF64F64 PassBoolToDataF64F64(bool v) {
    printf("PassBoolToDataF64F64: ");
    printf("%d\n", v);
    DataF64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    return s;
}

DataF32F32F32 PassInt8ToDataF32F32F32(signed char v) {
    printf("PassInt8ToDataF32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassInt16ToDataF32F32F32(short v) {
    printf("PassInt16ToDataF32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassInt32ToDataF32F32F32(int v) {
    printf("PassInt32ToDataF32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassInt64ToDataF32F32F32(long long v) {
    printf("PassInt64ToDataF32F32F32: ");
    printf("%lld\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassUInt8ToDataF32F32F32(unsigned char v) {
    printf("PassUInt8ToDataF32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassUInt16ToDataF32F32F32(unsigned short v) {
    printf("PassUInt16ToDataF32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassUInt32ToDataF32F32F32(unsigned int v) {
    printf("PassUInt32ToDataF32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassUInt64ToDataF32F32F32(unsigned long long v) {
    printf("PassUInt64ToDataF32F32F32: ");
    printf("%llu\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassFloat32ToDataF32F32F32(float v) {
    printf("PassFloat32ToDataF32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassFloat64ToDataF32F32F32(double v) {
    printf("PassFloat64ToDataF32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF32F32F32 PassBoolToDataF32F32F32(bool v) {
    printf("PassBoolToDataF32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    return s;
}

DataF64F64F64 PassInt8ToDataF64F64F64(signed char v) {
    printf("PassInt8ToDataF64F64F64: ");
    printf("%d\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassInt16ToDataF64F64F64(short v) {
    printf("PassInt16ToDataF64F64F64: ");
    printf("%d\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassInt32ToDataF64F64F64(int v) {
    printf("PassInt32ToDataF64F64F64: ");
    printf("%d\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassInt64ToDataF64F64F64(long long v) {
    printf("PassInt64ToDataF64F64F64: ");
    printf("%lld\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassUInt8ToDataF64F64F64(unsigned char v) {
    printf("PassUInt8ToDataF64F64F64: ");
    printf("%u\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassUInt16ToDataF64F64F64(unsigned short v) {
    printf("PassUInt16ToDataF64F64F64: ");
    printf("%u\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassUInt32ToDataF64F64F64(unsigned int v) {
    printf("PassUInt32ToDataF64F64F64: ");
    printf("%u\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassUInt64ToDataF64F64F64(unsigned long long v) {
    printf("PassUInt64ToDataF64F64F64: ");
    printf("%llu\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassFloat32ToDataF64F64F64(float v) {
    printf("PassFloat32ToDataF64F64F64: ");
    printf("%f\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassFloat64ToDataF64F64F64(double v) {
    printf("PassFloat64ToDataF64F64F64: ");
    printf("%f\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF64F64F64 PassBoolToDataF64F64F64(bool v) {
    printf("PassBoolToDataF64F64F64: ");
    printf("%d\n", v);
    DataF64F64F64 s;
    s.a = (double)v;
    s.b = (double)v;
    s.c = (double)v;
    return s;
}

DataF32F32F32F32 PassInt8ToDataF32F32F32F32(signed char v) {
    printf("PassInt8ToDataF32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassInt16ToDataF32F32F32F32(short v) {
    printf("PassInt16ToDataF32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassInt32ToDataF32F32F32F32(int v) {
    printf("PassInt32ToDataF32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassInt64ToDataF32F32F32F32(long long v) {
    printf("PassInt64ToDataF32F32F32F32: ");
    printf("%lld\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassUInt8ToDataF32F32F32F32(unsigned char v) {
    printf("PassUInt8ToDataF32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassUInt16ToDataF32F32F32F32(unsigned short v) {
    printf("PassUInt16ToDataF32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassUInt32ToDataF32F32F32F32(unsigned int v) {
    printf("PassUInt32ToDataF32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassUInt64ToDataF32F32F32F32(unsigned long long v) {
    printf("PassUInt64ToDataF32F32F32F32: ");
    printf("%llu\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassFloat32ToDataF32F32F32F32(float v) {
    printf("PassFloat32ToDataF32F32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassFloat64ToDataF32F32F32F32(double v) {
    printf("PassFloat64ToDataF32F32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32 PassBoolToDataF32F32F32F32(bool v) {
    printf("PassBoolToDataF32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    return s;
}

DataF32F32F32F32F32 PassInt8ToDataF32F32F32F32F32(signed char v) {
    printf("PassInt8ToDataF32F32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassInt16ToDataF32F32F32F32F32(short v) {
    printf("PassInt16ToDataF32F32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassInt32ToDataF32F32F32F32F32(int v) {
    printf("PassInt32ToDataF32F32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassInt64ToDataF32F32F32F32F32(long long v) {
    printf("PassInt64ToDataF32F32F32F32F32: ");
    printf("%lld\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassUInt8ToDataF32F32F32F32F32(unsigned char v) {
    printf("PassUInt8ToDataF32F32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassUInt16ToDataF32F32F32F32F32(unsigned short v) {
    printf("PassUInt16ToDataF32F32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassUInt32ToDataF32F32F32F32F32(unsigned int v) {
    printf("PassUInt32ToDataF32F32F32F32F32: ");
    printf("%u\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassUInt64ToDataF32F32F32F32F32(unsigned long long v) {
    printf("PassUInt64ToDataF32F32F32F32F32: ");
    printf("%llu\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassFloat32ToDataF32F32F32F32F32(float v) {
    printf("PassFloat32ToDataF32F32F32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassFloat64ToDataF32F32F32F32F32(double v) {
    printf("PassFloat64ToDataF32F32F32F32F32: ");
    printf("%f\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataF32F32F32F32F32 PassBoolToDataF32F32F32F32F32(bool v) {
    printf("PassBoolToDataF32F32F32F32F32: ");
    printf("%d\n", v);
    DataF32F32F32F32F32 s;
    s.a = (float)v;
    s.b = (float)v;
    s.c = (float)v;
    s.d = (float)v;
    s.e = (float)v;
    return s;
}

DataI8F32 PassInt8ToDataI8F32(signed char v) {
    printf("PassInt8ToDataI8F32: ");
    printf("%d\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassInt16ToDataI8F32(short v) {
    printf("PassInt16ToDataI8F32: ");
    printf("%d\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassInt32ToDataI8F32(int v) {
    printf("PassInt32ToDataI8F32: ");
    printf("%d\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassInt64ToDataI8F32(long long v) {
    printf("PassInt64ToDataI8F32: ");
    printf("%lld\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassUInt8ToDataI8F32(unsigned char v) {
    printf("PassUInt8ToDataI8F32: ");
    printf("%u\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassUInt16ToDataI8F32(unsigned short v) {
    printf("PassUInt16ToDataI8F32: ");
    printf("%u\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassUInt32ToDataI8F32(unsigned int v) {
    printf("PassUInt32ToDataI8F32: ");
    printf("%u\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassUInt64ToDataI8F32(unsigned long long v) {
    printf("PassUInt64ToDataI8F32: ");
    printf("%llu\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassFloat32ToDataI8F32(float v) {
    printf("PassFloat32ToDataI8F32: ");
    printf("%f\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassFloat64ToDataI8F32(double v) {
    printf("PassFloat64ToDataI8F32: ");
    printf("%f\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI8F32 PassBoolToDataI8F32(bool v) {
    printf("PassBoolToDataI8F32: ");
    printf("%d\n", v);
    DataI8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassInt8ToDataI32F32(signed char v) {
    printf("PassInt8ToDataI32F32: ");
    printf("%d\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassInt16ToDataI32F32(short v) {
    printf("PassInt16ToDataI32F32: ");
    printf("%d\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassInt32ToDataI32F32(int v) {
    printf("PassInt32ToDataI32F32: ");
    printf("%d\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassInt64ToDataI32F32(long long v) {
    printf("PassInt64ToDataI32F32: ");
    printf("%lld\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassUInt8ToDataI32F32(unsigned char v) {
    printf("PassUInt8ToDataI32F32: ");
    printf("%u\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassUInt16ToDataI32F32(unsigned short v) {
    printf("PassUInt16ToDataI32F32: ");
    printf("%u\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassUInt32ToDataI32F32(unsigned int v) {
    printf("PassUInt32ToDataI32F32: ");
    printf("%u\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassUInt64ToDataI32F32(unsigned long long v) {
    printf("PassUInt64ToDataI32F32: ");
    printf("%llu\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassFloat32ToDataI32F32(float v) {
    printf("PassFloat32ToDataI32F32: ");
    printf("%f\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassFloat64ToDataI32F32(double v) {
    printf("PassFloat64ToDataI32F32: ");
    printf("%f\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI32F32 PassBoolToDataI32F32(bool v) {
    printf("PassBoolToDataI32F32: ");
    printf("%d\n", v);
    DataI32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    return s;
}

DataI8F64 PassInt8ToDataI8F64(signed char v) {
    printf("PassInt8ToDataI8F64: ");
    printf("%d\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassInt16ToDataI8F64(short v) {
    printf("PassInt16ToDataI8F64: ");
    printf("%d\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassInt32ToDataI8F64(int v) {
    printf("PassInt32ToDataI8F64: ");
    printf("%d\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassInt64ToDataI8F64(long long v) {
    printf("PassInt64ToDataI8F64: ");
    printf("%lld\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassUInt8ToDataI8F64(unsigned char v) {
    printf("PassUInt8ToDataI8F64: ");
    printf("%u\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassUInt16ToDataI8F64(unsigned short v) {
    printf("PassUInt16ToDataI8F64: ");
    printf("%u\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassUInt32ToDataI8F64(unsigned int v) {
    printf("PassUInt32ToDataI8F64: ");
    printf("%u\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassUInt64ToDataI8F64(unsigned long long v) {
    printf("PassUInt64ToDataI8F64: ");
    printf("%llu\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassFloat32ToDataI8F64(float v) {
    printf("PassFloat32ToDataI8F64: ");
    printf("%f\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassFloat64ToDataI8F64(double v) {
    printf("PassFloat64ToDataI8F64: ");
    printf("%f\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI8F64 PassBoolToDataI8F64(bool v) {
    printf("PassBoolToDataI8F64: ");
    printf("%d\n", v);
    DataI8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassInt8ToDataI32F64(signed char v) {
    printf("PassInt8ToDataI32F64: ");
    printf("%d\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassInt16ToDataI32F64(short v) {
    printf("PassInt16ToDataI32F64: ");
    printf("%d\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassInt32ToDataI32F64(int v) {
    printf("PassInt32ToDataI32F64: ");
    printf("%d\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassInt64ToDataI32F64(long long v) {
    printf("PassInt64ToDataI32F64: ");
    printf("%lld\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassUInt8ToDataI32F64(unsigned char v) {
    printf("PassUInt8ToDataI32F64: ");
    printf("%u\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassUInt16ToDataI32F64(unsigned short v) {
    printf("PassUInt16ToDataI32F64: ");
    printf("%u\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassUInt32ToDataI32F64(unsigned int v) {
    printf("PassUInt32ToDataI32F64: ");
    printf("%u\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassUInt64ToDataI32F64(unsigned long long v) {
    printf("PassUInt64ToDataI32F64: ");
    printf("%llu\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassFloat32ToDataI32F64(float v) {
    printf("PassFloat32ToDataI32F64: ");
    printf("%f\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassFloat64ToDataI32F64(double v) {
    printf("PassFloat64ToDataI32F64: ");
    printf("%f\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI32F64 PassBoolToDataI32F64(bool v) {
    printf("PassBoolToDataI32F64: ");
    printf("%d\n", v);
    DataI32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    return s;
}

DataI8F32I8F32 PassInt8ToDataI8F32I8F32(signed char v) {
    printf("PassInt8ToDataI8F32I8F32: ");
    printf("%d\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassInt16ToDataI8F32I8F32(short v) {
    printf("PassInt16ToDataI8F32I8F32: ");
    printf("%d\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassInt32ToDataI8F32I8F32(int v) {
    printf("PassInt32ToDataI8F32I8F32: ");
    printf("%d\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassInt64ToDataI8F32I8F32(long long v) {
    printf("PassInt64ToDataI8F32I8F32: ");
    printf("%lld\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassUInt8ToDataI8F32I8F32(unsigned char v) {
    printf("PassUInt8ToDataI8F32I8F32: ");
    printf("%u\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassUInt16ToDataI8F32I8F32(unsigned short v) {
    printf("PassUInt16ToDataI8F32I8F32: ");
    printf("%u\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassUInt32ToDataI8F32I8F32(unsigned int v) {
    printf("PassUInt32ToDataI8F32I8F32: ");
    printf("%u\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassUInt64ToDataI8F32I8F32(unsigned long long v) {
    printf("PassUInt64ToDataI8F32I8F32: ");
    printf("%llu\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassFloat32ToDataI8F32I8F32(float v) {
    printf("PassFloat32ToDataI8F32I8F32: ");
    printf("%f\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassFloat64ToDataI8F32I8F32(double v) {
    printf("PassFloat64ToDataI8F32I8F32: ");
    printf("%f\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI8F32I8F32 PassBoolToDataI8F32I8F32(bool v) {
    printf("PassBoolToDataI8F32I8F32: ");
    printf("%d\n", v);
    DataI8F32I8F32 s;
    s.a = (int8_t)v;
    s.b = (float)v;
    s.c = (int8_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassInt8ToDataI32F32I32F32(signed char v) {
    printf("PassInt8ToDataI32F32I32F32: ");
    printf("%d\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassInt16ToDataI32F32I32F32(short v) {
    printf("PassInt16ToDataI32F32I32F32: ");
    printf("%d\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassInt32ToDataI32F32I32F32(int v) {
    printf("PassInt32ToDataI32F32I32F32: ");
    printf("%d\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassInt64ToDataI32F32I32F32(long long v) {
    printf("PassInt64ToDataI32F32I32F32: ");
    printf("%lld\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassUInt8ToDataI32F32I32F32(unsigned char v) {
    printf("PassUInt8ToDataI32F32I32F32: ");
    printf("%u\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassUInt16ToDataI32F32I32F32(unsigned short v) {
    printf("PassUInt16ToDataI32F32I32F32: ");
    printf("%u\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassUInt32ToDataI32F32I32F32(unsigned int v) {
    printf("PassUInt32ToDataI32F32I32F32: ");
    printf("%u\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassUInt64ToDataI32F32I32F32(unsigned long long v) {
    printf("PassUInt64ToDataI32F32I32F32: ");
    printf("%llu\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassFloat32ToDataI32F32I32F32(float v) {
    printf("PassFloat32ToDataI32F32I32F32: ");
    printf("%f\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassFloat64ToDataI32F32I32F32(double v) {
    printf("PassFloat64ToDataI32F32I32F32: ");
    printf("%f\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI32F32I32F32 PassBoolToDataI32F32I32F32(bool v) {
    printf("PassBoolToDataI32F32I32F32: ");
    printf("%d\n", v);
    DataI32F32I32F32 s;
    s.a = (int32_t)v;
    s.b = (float)v;
    s.c = (int32_t)v;
    s.d = (float)v;
    return s;
}

DataI8F64I8F64 PassInt8ToDataI8F64I8F64(signed char v) {
    printf("PassInt8ToDataI8F64I8F64: ");
    printf("%d\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassInt16ToDataI8F64I8F64(short v) {
    printf("PassInt16ToDataI8F64I8F64: ");
    printf("%d\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassInt32ToDataI8F64I8F64(int v) {
    printf("PassInt32ToDataI8F64I8F64: ");
    printf("%d\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassInt64ToDataI8F64I8F64(long long v) {
    printf("PassInt64ToDataI8F64I8F64: ");
    printf("%lld\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassUInt8ToDataI8F64I8F64(unsigned char v) {
    printf("PassUInt8ToDataI8F64I8F64: ");
    printf("%u\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassUInt16ToDataI8F64I8F64(unsigned short v) {
    printf("PassUInt16ToDataI8F64I8F64: ");
    printf("%u\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassUInt32ToDataI8F64I8F64(unsigned int v) {
    printf("PassUInt32ToDataI8F64I8F64: ");
    printf("%u\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassUInt64ToDataI8F64I8F64(unsigned long long v) {
    printf("PassUInt64ToDataI8F64I8F64: ");
    printf("%llu\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassFloat32ToDataI8F64I8F64(float v) {
    printf("PassFloat32ToDataI8F64I8F64: ");
    printf("%f\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassFloat64ToDataI8F64I8F64(double v) {
    printf("PassFloat64ToDataI8F64I8F64: ");
    printf("%f\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI8F64I8F64 PassBoolToDataI8F64I8F64(bool v) {
    printf("PassBoolToDataI8F64I8F64: ");
    printf("%d\n", v);
    DataI8F64I8F64 s;
    s.a = (int8_t)v;
    s.b = (double)v;
    s.c = (int8_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassInt8ToDataI32F64I32F64(signed char v) {
    printf("PassInt8ToDataI32F64I32F64: ");
    printf("%d\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassInt16ToDataI32F64I32F64(short v) {
    printf("PassInt16ToDataI32F64I32F64: ");
    printf("%d\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassInt32ToDataI32F64I32F64(int v) {
    printf("PassInt32ToDataI32F64I32F64: ");
    printf("%d\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassInt64ToDataI32F64I32F64(long long v) {
    printf("PassInt64ToDataI32F64I32F64: ");
    printf("%lld\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassUInt8ToDataI32F64I32F64(unsigned char v) {
    printf("PassUInt8ToDataI32F64I32F64: ");
    printf("%u\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassUInt16ToDataI32F64I32F64(unsigned short v) {
    printf("PassUInt16ToDataI32F64I32F64: ");
    printf("%u\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassUInt32ToDataI32F64I32F64(unsigned int v) {
    printf("PassUInt32ToDataI32F64I32F64: ");
    printf("%u\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassUInt64ToDataI32F64I32F64(unsigned long long v) {
    printf("PassUInt64ToDataI32F64I32F64: ");
    printf("%llu\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassFloat32ToDataI32F64I32F64(float v) {
    printf("PassFloat32ToDataI32F64I32F64: ");
    printf("%f\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassFloat64ToDataI32F64I32F64(double v) {
    printf("PassFloat64ToDataI32F64I32F64: ");
    printf("%f\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}

DataI32F64I32F64 PassBoolToDataI32F64I32F64(bool v) {
    printf("PassBoolToDataI32F64I32F64: ");
    printf("%d\n", v);
    DataI32F64I32F64 s;
    s.a = (int32_t)v;
    s.b = (double)v;
    s.c = (int32_t)v;
    s.d = (double)v;
    return s;
}
