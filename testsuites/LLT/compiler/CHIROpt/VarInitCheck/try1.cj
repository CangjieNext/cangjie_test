// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj
class CA {
    var x = 1
}

public func tryCatchFinally1() {
    let a: CA
    let b: CA
    let c: CA
    let d: CA
    try {
        a = CA()
        d = CA()
    } catch (_) {
        println(a.x)
        b = CA()
        d = CA()
    } finally {
        println("${a.x}, ${b.x}, ${d.x}")
        c = CA()
    }
    println("${a.x}, ${b.x}, ${c.x}, ${d.x}")
    a = CA()
    b = CA()
    c = CA()
    d = CA()
}

public func tryCatchFinally2(cond: Bool) {
    let a: CA
    try {
        if (cond) {
            a = CA()
        }
    } catch (_) {
        a = CA()
    } finally {
        if (cond) {
            a = CA()
        }
    }
}

public func tryFinally() {
    let a: CA
    let b: CA
    try {
        a = CA()
    } finally {
        b = CA()
    }
    println("${a.x}, ${b.x}")
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_used_before_initialization
// ASSERT: scan chir_cannot_assign_initialized_let_variable
