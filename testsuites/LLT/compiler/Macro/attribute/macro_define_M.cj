// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_define_A.cj
// EXEC:%compiler %cmp_opt macro_define_A.cj %cmp_macro
// ERRCHECK:%compiler %ulimit-error %noColor %f %compile_lib_opt -o %n.o
// ASSERT: scan unexpected parameters for macro invocation here
// ASSERT: scan macro declaration must be modified with 'public'

macro package test
import A.*
import std.ast.*

@MA[1]
macro M(a:Tokens,b:Tokens){
    return b
}
