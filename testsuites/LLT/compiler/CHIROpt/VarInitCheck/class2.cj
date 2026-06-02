// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

class A {
    var a1: Int32
    public init() {
        var a = this.a1
        this.a1 = 1
    }
}

main(): Int32 {
    var abc: A
    abc.a1 = 12
    abc = A()
    println(abc.a1)
    return 0
}
// ASSERT: scan chir_used_before_initialization
