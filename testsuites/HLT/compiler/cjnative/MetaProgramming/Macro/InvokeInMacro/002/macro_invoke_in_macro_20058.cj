/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20058.cj main_20058.cj
// EXEC: %compiler %cmp_macro define_20058.cj
// EXEC: %compiler %f  %cmp_macro

// EXEC: %compiler %cmp_opt main_20058.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

macro package use

import std.sync.*
import std.ast.*
import define_20058.*

public macro Y(attr: Tokens, input: Tokens): Tokens {
    var a: ReentrantMutex = ReentrantMutex()
    synchronized(a) {
        @X[0](1)
    }
    return quote(0)
}
