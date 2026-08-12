// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// e/f depend on mutable control flow -> remain Loads.
// ASSERT: scan Load(@_CN7default1eE)
// ASSERT: scan Load(@_CN7default1fE)

var a = 1
var b = true
var c = foo()
var d = 2
var e = if (b) {
    d
} else {
    d - 2
}
var f = if (b) {
    let f1 = foo();
    d - 2
} else {
    let f2 = d;
    f2 - 1
}

func foo(): Int64 {
    a = 2
    b = false
    return a
}

main(): Int64 {
    if (e == 0 && f == 1) {
        return 0
    } else {
        return 1
    }
}
