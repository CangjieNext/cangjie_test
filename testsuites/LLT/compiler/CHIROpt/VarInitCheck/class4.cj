// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

var flag = true

open class A {
    let a1: Int32
    public init() {}
}

class B <: A {
    var b1 = if (flag) {
        a1 = 3
        a1;
        1
    } else {
        2
    }
    public init() {
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_class_uninitialized_field
// ASSERT: scan chir_illegal_usage_of_super_member
