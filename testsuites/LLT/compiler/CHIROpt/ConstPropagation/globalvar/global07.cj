// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Exit(

var cond = mkcond()
var a = 1
var c = if (cond) {
    hoo();
    foo();
    3
} else {
    a
}
var d = c

func foo(): Int64 {
    a = 2
    return a
}

func hoo() {
    throw Exception("ttt")
}

func mkcond() {
    return false
}

main(): Int64 {
    0
}
