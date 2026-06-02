// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
typedef struct {
    long long x;
    long long y;
    long long z;
} BiggerStruct;

BiggerStruct PassToCBigger(BiggerStruct input)
{
    int times = 2;
    input.x = input.x * times;
    input.y = input.y * times;
    input.z = input.z * times;
    return input;
}
