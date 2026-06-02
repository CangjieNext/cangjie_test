// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

public macro bar(x: Tokens): Tokens {
    return quote($x)
}

main() {
    var rightOp: Tokens = quote(3)
    quote(2 + $rightOp)
    quote($x)
    quote($x + 2)
    quote($x + (2 + 3))
    quote(1 + ($x + 1) * 2)
    quote(1 + $(x + 1) * 2)
}
