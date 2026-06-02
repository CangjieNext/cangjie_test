// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt -Woff unused %diag_json %n.cj 

struct A {
    let a1 = 1
    var a2 = 2
    var a3 = B()
}

class B {
    let b1 = 1
    var b2 = 2
}

main(): Int32 {
    var x1 = A()
    x1.a1 = 1
    x1.a2 = 2

    var x2 = B()
    x2.b1 = 1
    x2.b2 = 2

    let y2 = B()
    y2.b1 = 1
    y2.b2 = 2

    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
