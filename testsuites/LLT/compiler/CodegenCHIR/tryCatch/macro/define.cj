// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

internal import std.ast.*

func foo(flag: Bool): Int64 {
    if (flag) {
        throw Exception()
    } else {
        return 0
    }
    return 1
}

var x = foo(true)

public macro M(input: Tokens) {
    input
}
