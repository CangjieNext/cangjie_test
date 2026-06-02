// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package p1

internal import std.ast.*
public import pre.Pre as PreMac // PreMac is visible to other packages

public macro M1(input: Tokens) {
    input
}
