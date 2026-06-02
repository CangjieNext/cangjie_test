// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a = true

interface aa {}

interface d {}

class b <: d {}

enum e {
    f(UInt64, d, (Float32, Float64, Unit, Int64), UInt16)
}

func g() {
    if (match (if (false) {
        let h = f(4, b(), (123.0, 15.0, (), 0), 0)
        h
    } else {
        let i = f(9, b(), (35.0, 97.0, (), 0), 8)
        i
    }) {
        case f(n: aa, k, (124.0, l, o, mm), j) => false
        case cc => a
    }) {
        true
    } else {
        false
    }
}

let x = false
let y = C(false)

enum D {
    C(Bool)
}

func E() {
    var f: (Bool, Unit, Int16) = (true, (), 6)
    match (y) {
        case C(g: D) =>
            let h: Int16 = 9
            (x, (), h)
        case i => f
    }
}

let p = q

enum c {
    q
    | m(UInt32, UInt32)
}

func ee() {
    match (if (false) {
        p
    } else {
        m(7, 0)
    }) {
        case m(8, f: UInt16) => 6
        case gg => 0
    }
}

main() {
    var res1 = E()[0]
    var res2 = g()
    if (!(res1 && res2)) {
        return 1
    }
    return ee()
}
