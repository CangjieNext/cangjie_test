// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Load(@_CN7default1yE)
// ASSERT: scan Constant(1i)
// ASSERT: scan Constant(2i)

let x = (1, 2)
var y = x[0]

let (a, b) = (x[1], y)

func foo() {
    var m1 = y
    var m2 = a
    var m3 = b
    if (x[0] == 1 && x[1] == 2 && y == 1 && a == 2 && b == 1) {
        0
    } else {
        1
    }
}

main() {
    foo()
}
