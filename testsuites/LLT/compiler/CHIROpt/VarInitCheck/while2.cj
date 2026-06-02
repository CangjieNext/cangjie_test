// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

var cond = true

public func foo1() {
    while (cond) {
        let a: Int32
        a = 1
    }
}

public func foo2() {
    while (cond) {
        let a: Int32
        a = 1
        while (cond) {
            let a: Int32
            a = 1
        }
    }
}

public func foo3() {
    while (cond) {
        let a: Int32
        while (cond) {
            let b: Int32
            a = 1
            println(b)
        }
        println(a)
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_cannot_assign_initialized_let_variable
// ASSERT: scan-2 chir_used_before_initialization
