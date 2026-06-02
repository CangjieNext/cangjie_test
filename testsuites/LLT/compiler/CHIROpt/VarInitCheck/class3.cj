// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

open class A {
    let a1: Int32
    public init() {}
}

class B <: A {
    public init() {
        a1 = 33
    }
}

main() {
    0
}
// ASSERT: scan chir_class_uninitialized_field
// ASSERT: scan chir_cannot_assign_initialized_let_variable
