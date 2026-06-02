// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args

import std.collection.*

// main.cj
enum E {
    E0(A)
    | E1(B)

    func foo() {
        match (this) {
            case E0(a: A) => a.d.foo()
            case E1(a: B) => a.d.foo()
        }
    }
}

struct Data {
    let data = ArrayList<Int64>(10)
    func foo() {
        data.size
    }
}

struct A {
    A(let e: E, let d: Data) {}
}

struct B {
    B(let d: Data) {}
}

main() {
    let d = Data()
    d.data.add(1)
    d.data.add(2)
    if (d.foo() != 2) {
        return 1
    }

    let b = B(d)
    let e1 = E.E1(b)
    if (e1.foo() != 2) {
        return 1
    }

    let a = A(e1, d)
    let e2 = E.E0(a)
    if (e2.foo() != 2) {
        return 1
    }

    0
}

// ASSERT: regex-begin %\d+: Tuple<UInt32,Bool,Box<Struct-_CN7default1SE>&,Class-\$Cg0_<Bool>&> = TypeCast\(%\d+, Tuple<UInt32,Bool,Box<Struct-_CN7default1SE>&,Class-\$Cg0_<Bool>&>\) // loc: "recursionEnum05.cj"-14-11
// ASSERT: regex-next %\d+: Bool = Field\(%\d+, 1\)
// ASSERT: regex-next %\d+: Box<Struct-_CN7default1SE>& = Field\(%\d+, 2\)
