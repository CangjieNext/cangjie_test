// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

class A {
    let a1: Int32
    public func goo() {
        println("hi")
    }
    public init() {
        var ca: A
        ca.goo()
        a1 = 3
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_used_before_initialization
