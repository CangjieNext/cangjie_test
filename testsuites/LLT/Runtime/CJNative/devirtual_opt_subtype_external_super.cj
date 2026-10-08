// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Checking a class instance against a closure type asks `CJDevirtualOpt` for
// the closure relation of `C`. The super class type info of `C` is declared in
// another module (`std.core:Object`), so it has no initializer here and the
// relation is unknown. Reading it as if it had one used to crash the compiler
// at -O2 (SIGSEGV inside `opt -passes=default<O2> --cangjie-pipeline`), and
// folding the unknown relation to `false` is wrong as well: it must be left to
// the runtime, which answers false because `C` is not a closure.
// EXEC: %compiler %cmp_opt %f -o %n.o0
// RUN-EXEC: %run %run_opt %n.o0
// EXEC: %compiler %cmp_opt %f %enableO2 -o %n.o2
// RUN-EXEC: %run %run_opt %n.o2

class C {}

main(): Int64 {
    var c: Any = C()
    if (c is (Rune) -> Unit) {
        return 1
    }
    return 0
}
