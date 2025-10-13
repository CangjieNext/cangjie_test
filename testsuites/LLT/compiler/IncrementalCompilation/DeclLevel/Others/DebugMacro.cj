// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %f --compile-macro
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output %macro_debug
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 %macro_debug | compare %f
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %n.new.cj

macro package fm

import std.ast.*

public macro car(f: Tokens): Tokens {
    f
}

// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:P in file DebugMacro.old.cj.macrocall in line 4 in column 16
// ASSERT: scan the changed decl after Spreading is:f in file DebugMacro.old.cj.macrocall in line 5 in column 25
// ASSERT: scan the changed decl after Spreading is:foo in file DebugMacro.old.cj.macrocall in line 9 in column 6

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
