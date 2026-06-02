// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %output 2>&1 | compare %f

class C {
    let bf = false
    let bt = true

    var b = false
    var s = ""

    func f() {
        s += "f"
        return this
    }

    func g() {
        s += "g"
        return this
    }
}

main() {
    let c = C()
    c.f().b &&= c.g().bt
    println(c.s)
}

/* SCAN
f
*/