// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

var cond: Bool = true

public func foo1() {
    let a: Int32
    while (cond) {
        a = 1
        return
    }
    a = 2
}

public func foo2() {
    let a: Int32
    while (cond) {
        a = 1
        continue
    }
    a = 2
}

public func foo3() {
    let a: Int32
    while (cond) {
        a = 1
        throw Exception()
    }
    a = 2
}

main(): Int32 {
    return 0
}
// ASSERT: scan-2 chir_cannot_assign_initialized_let_variable
