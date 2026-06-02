// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

public func foo1() {
    for (_ in 0..5) {
        let a: Int32
        a = 1
    }
}

public func foo2() {
    let a: Int32
    for (_ in 0..5) {
        a = 1
    }
}

public func foo3() {
    for (i in 0..5) {
        let a: Int32
        for (_ in 0..i) {
            a = 1
        }
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan-2 chir_cannot_assign_initialized_let_variable
