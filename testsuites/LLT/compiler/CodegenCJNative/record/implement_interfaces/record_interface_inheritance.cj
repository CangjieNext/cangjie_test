// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface C2 {
    func g(): String
}

interface C <: C2 {
    func f(): String
}

struct A {}

extend A <: C {
    public func f(): String {
        "A"
    }
    public func g(): String {
        "B"
    }
}

main() {
    var a: C2 = A()
    if (a.g() != "B") {
        return 1
    }
    var b = match (a) {
        case c: C => c.f()
        case _ => "you cannot be here"
    }
    if (b != "A") {
        return 1
    }
    return 0
}
