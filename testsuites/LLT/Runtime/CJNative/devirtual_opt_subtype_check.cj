// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The subtype check below can not be decided by `CJDevirtualOpt` at compile
// time: `Rune`/`Any` type infos are declared in std.core, so they have no
// initializer in this module and the closure relation is unknown here.
// Such a check must be kept and answered by the runtime. Folding it to `false`
// made -O2 return 1 while -O0 returns 0.
// EXEC: %compiler %cmp_opt %f -o %n.o0
// RUN-EXEC: %run %run_opt %n.o0
// EXEC: %compiler %cmp_opt %f %enableO2 -o %n.o2
// RUN-EXEC: %run %run_opt %n.o2

main(): Int64 {
    var b = if (false) {
        foo1
    } else {
        foo2
    }
    // `foo2: (Any) -> Unit` is a subtype of `(Rune) -> Unit` at runtime
    // (function parameters are contra-variant), so this must yield 0.
    return match (b) {
        case y: (Rune) -> Unit => 0
        case _ => 1
    }
}

func foo1(x: Rune): Unit {}

func foo2(x: Any): Unit {}
