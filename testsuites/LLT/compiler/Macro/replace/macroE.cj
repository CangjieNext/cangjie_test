// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %pwd_to_ld_path %compiler %cmp_macro %noColor %f

macro package define

internal import std.ast.*

func f() {}

enum E {
    e
}

public macro e(a: Tokens) {
    return a
}
