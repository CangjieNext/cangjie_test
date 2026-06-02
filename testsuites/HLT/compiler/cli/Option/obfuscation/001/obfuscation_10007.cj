/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// EXEC: %compiler %compile_dylib_opt %obf_string %f -o %output
// EXEC: %compiler %compile_dylib_opt %no_obf_string %f -o %output_no_obf
// cannot find.
// (not iOS) RUN-EXEC-1: strings %output | grep TEST_FOR_OBF_STRING
// can find.
// (not iOS) RUN-EXEC: strings %output_no_obf | grep TEST_FOR_OBF_STRING

macro package test

import std.ast.*

var a = 1
var b = "TEST_FOR_OBF_STRING_${a}"

public macro M(i: Tokens) {
    i
}
