/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30013.cj main_30013.cj
// EXEC: %compiler define_30013.cj %cmp_macro
// EXEC: %compiler %f %cmp_macro
// EXEC: %compiler %cmp_opt main_30013.cj -o %output

// RUN-EXEC: %run %run_opt %output

macro package use

import std.ast.*
import define_30013.*

public macro X(input: Tokens): Tokens {
    return quote(1+1)
}

// public func x(){}
