// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_define.cj main.cj
// (CJNATIVE) EXEC: %compiler %cmp_macro macro_define.cj
// (CJNATIVE) EXEC: %compiler %f %cmp_macro
// (CJNATIVE) EXEC: %compiler %cmp_opt  main.cj -o %output
// (not CJNATIVE) EXEC: %compiler %cmp_macro %compile_lib_opt macro_define.cj
// (not CJNATIVE) EXEC: %compiler %f %compile_lib_opt
// (not CJNATIVE) EXEC: %compiler %cmp_opt main.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

macro package test

internal import std.ast.*
public import define.x as X

public macro x(input: Tokens) {
    var a = @X(1)
    return input
}
