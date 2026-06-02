// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj
class CA {
    var x = 1
}

public func foo1() {
    let a: CA
    try {
        a = CA()
        throw Exception()
    } finally {
        a = CA()
    }
    a = CA()
}

public func foo2() {
    var a: CA
    try {
        throw Exception()
    } catch (_) {
        a = CA()
    }
    println(a.x)
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_cannot_assign_initialized_let_variable
