/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test_20004.cj
// EXEC: %compiler %f %compile_lib_opt -o ./test_20004.%test_suffix
// EXEC: %compiler test_20004.cj %compile_lib_opt

macro package define

import std.ast.*

public macro M(input: Tokens) {
    return quote(1)
}
