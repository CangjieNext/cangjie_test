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
        return
    } finally {
        a = CA()
    }
    a = CA()
}

public func foo2() {
    let a: CA
    try {
        a = CA()
        return
    } catch (_) {
    } finally {
        a = CA()
    }
    a = CA()
}

public func foo3() {
    let a: CA
    try {
    } catch (_) {
        a = CA()
        return
    } finally {
        a = CA()
    }
    a = CA()
}

public func foo4() {
    let a: CA
    try {
    } catch (_) {
    } finally {
        a = CA()
        return
    }
    a = CA()
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_cannot_assign_initialized_let_variable
