// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Load(@_CN7default1bE)
// ASSERT: scan Load(@_CN7default1cE)
// ASSERT: scan Load(@_CN7default1dE)
// ASSERT: scan Load(@_CN7default1fE)

var a = 1
var b = try {
    var b1 = foo();
    b1
} catch (_) {
    a
}
var c = if (true) {
    a = 3
    b
} else {
    a
}
var d = a
var e = 4
let f = if (true) {
    while (true) {
        var f1 = e;
        if (goo() > 1) {
            break
        }
    };
    e
} else {
    e
}

func foo(): Int64 {
    a = 2
    return a
}

func goo(): Int64 {
    e = 5
    return e
}

main(): Int64 {
    if (b == 2 && c == 2 && d == 3 && f == 5) {
        return 0
    } else {
        return 1
    }
}
