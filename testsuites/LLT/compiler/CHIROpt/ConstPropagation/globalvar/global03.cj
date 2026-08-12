// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default8global01Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Load(@_CN7default2g3E)
// ASSERT: scan Load(@_CN7default2g4E)
// ASSERT: scan Load(@_CN7default2g5E)
// ASSERT: scan Load(@_CN7default2g6E)

let g1 = 1
var g2 = g1
let g3 = if (true) {
    func foo() {
        g2 = 2
        g2
    };
    foo()
} else {
    func foo() {
        g1
    };
    foo()
}
var g4 = g2
let g5 = if (true) {
    func foo() {
        g4 = 3
        g4
    };
    foo
} else {
    func foo() {
        g1
    };
    foo
}
let g6 = g4

func global01(): Int64 {
    var result = g3.toString() + g4.toString() + g5().toString() + g6.toString()
    println(result)
    if (result == "2232") {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return global01()
}
