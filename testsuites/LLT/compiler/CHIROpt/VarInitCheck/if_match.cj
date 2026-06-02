// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

public func goo(x: Int64) {
}

public func foo1(cond: Bool): Int64 {
    var x: Int64
    if (cond) {
        x = 1
    }

    return x
}

public func foo2(cond: Bool) {
    var x: Int64
    if (cond) {
    } else {
        x = 1
    }

    println(x)
}

public func foo3(cond: Bool) {
    var x: Int64
    if (cond) {
        x = 2
    } else {
        x = 1
    }

    goo(x)
}

public func foo4(cond: Bool) {
    var x: Int64
    let y: Int32
    while (cond) {
        x = 2
        y = 3
    }
    println(y)
    y = 4

    goo(x)
}

public func foo5(cond: Int32) {
    var x: Int64
    match (cond) {
        case 1 => x = 1
        case 2 => x = 2
        case 3 => x = 3
        case _ => println(x)
    }

    goo(x)
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_used_before_initialization
// ASSERT: scan chir_cannot_assign_initialized_let_variable
