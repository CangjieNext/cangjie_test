// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK:%compiler %disableSemaVic %cmp_opt -Woff unused %diag_json %n.cj

var cond1: Bool = true;
var cond2: Bool = true;
var cond3: Bool = true

public func maybeInited1() {
    let a: Int32
    if (cond1) {
        if (cond2) {
            a = 3
        }
    } else {
        return
    }
    a = 5
}

public func maybeInited2() {
    let a: Int32
    if (cond1) {
        return
    } else {
        if (cond2) {
            a = 3
        }
    }
    a = 5
}

public func maybeInited3() {
    let a: Int32
    while (cond1) {
        if (cond2) {
            a = 1
            continue
        }
    }
    println(a)
    a = 2
}

public func maybeInited4() {
    let a: Int32
    while (cond1) {
        if (cond2) {
            a = 1
            break
        }
    }
    println(a)
    a = 2
}

public func mustNotInited1() {
    let a: Int32
    while (cond1) {
        if (cond2) {
            a = 1
            return
        }
        if (cond3) {
            a = 2
            throw Exception()
        }
    }
    println(a)
    a = 2
}

public func mustInited1() {
    let a: Int32
    if (cond1) {
        return
    } else {
        a = 1
    }
    println(a)

    let b: Int32
    if (cond2) {
        b = 1
    } else {
        throw Exception()
    }
    println(b)
}

public func mustInited2() {
    let a: Int32
    if (cond1) {
        if (cond2) {
            return
        } else {
            throw Exception()
        }
    } else {
        a = 1
    }
    println(a)
}

public func mustInited3(y: Int32) {
    var x: Int64
    match (y) {
        case 1 => return
        case 2 => return
        case 3 => x = 3
        case _ => throw Exception()
    }
    println(x)
}

public func mustInited4() {
    var a: Int64
    var b: Int64
    while (cond1) {
        if (cond2) {
            continue
        } else {
            a = 1
        }
        println(a)
        if (cond3) {
            return
        } else {
            b = 1
        }
        println(b)
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_cannot_assign_initialized_let_variable
// ASSERT: scan chir_used_before_initialization
