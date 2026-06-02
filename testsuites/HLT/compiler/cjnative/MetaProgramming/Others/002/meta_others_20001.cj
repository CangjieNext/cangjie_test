/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_20001.cj
// EXEC: %compiler %cmp_opt test_20001.cj %enable_macro %compile_lib_opt -o libtest_20001.%test_suffix
// (not Windows) EXEC: %compiler %cmp_opt %f %compile_lib_opt -o ./%n.%test_suffix
// (Windows) EXEC: %compiler %cmp_opt %f %compile_dylib_opt -o ./%n.%test_suffix -L. -ltest_20001

macro package define

import std.ast.*
import test20001.*

public macro M1(input: Tokens) {
    test()
    return quote(1)
}
