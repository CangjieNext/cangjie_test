// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan-not core dump

open class A {}

class B <: A {
    var b1 = 9
}

struct C {
    var c1 = 8
}

func foo1(): Int64 {
    let a: A = B()
    let b: Any = a
    match (b) {
        case x: B where x.b1 == 9 => return 0
        case _ => return 1
    }
}

func foo2(): Int64 {
    let a: C = C()
    let b: Any = a
    match (b) {
        case x: C where x.c1 == 8 => return 0
        case _ => return 1
    }
}

main(): Int64 {
    return foo1() + foo2()
}