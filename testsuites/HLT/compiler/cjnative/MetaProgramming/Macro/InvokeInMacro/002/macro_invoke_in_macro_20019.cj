/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20019.cj main_20019.cj
// EXEC: %compiler %cmp_macro define_20019.cj
// EXEC: %compiler %f  %cmp_macro
// EXEC: %compiler %cmp_opt  main_20019.cj -o %output


// RUN-EXEC: %run %run_opt %output %run_args

macro package use

import std.ast.*
import define_20019.*

interface op<T> {
    operator func ^(b: T): T
}

extend Tokens <: op<Tokens> {
    public operator func ^(b: Tokens) {
        this
    }
}

public macro Y(attr: Tokens, input: Tokens): Tokens {
    @X[123](123) ^ @X[123](123)
}
