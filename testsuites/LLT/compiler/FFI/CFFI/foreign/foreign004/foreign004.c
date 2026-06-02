// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// for LLVM BE ARM testcase

#include <stdbool.h>
#include <stdint.h>

struct Empty{};

struct Empty2 { struct Empty e; };

struct Empty2 a4(struct Empty2 a) { return a; }








