// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package b.test

import b.define_50003.*
internal import std.ast.*

public macro XX(a: Tokens) {
    var aNew = @X(0)
    return quote($aNew)
}

public macro YY(a: Tokens, b: Tokens) {
    var aNew = @Y[1](0)
    return quote($aNew)
}
