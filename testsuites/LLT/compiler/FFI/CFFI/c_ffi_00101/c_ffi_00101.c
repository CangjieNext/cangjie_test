// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stddef.h>
#include <stdbool.h>

bool PassToCBool(bool input)
{
    return !input;
}

signed char PassToCInt8(signed char input)
{
    return input * 2;
}

short PassToCInt16(short input)
{
    return input * 2;
}

int PassToCInt32(int input)
{
    return input * 2;
}

long long PassToCInt64(long long input)
{
    return input * 2;
}

unsigned char PassToCUInt8(unsigned char input)
{
    return input * 2;
}

unsigned short PassToCUInt16(unsigned short input)
{
    return input * 2;
}

unsigned int PassToCUInt32(unsigned int input)
{
    return input * 2;
}

unsigned long long PassToCUInt64(unsigned long long input)
{
    return input * 2;
}

size_t PassToCSizet(size_t input)
{
    return input * 2;
}

