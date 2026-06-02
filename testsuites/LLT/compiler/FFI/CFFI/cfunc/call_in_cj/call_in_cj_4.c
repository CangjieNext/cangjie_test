// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>

int32_t runCallback(int32_t (*cb)(int32_t, int32_t), int32_t a, int32_t b)
{
    return cb(a, b);
}
