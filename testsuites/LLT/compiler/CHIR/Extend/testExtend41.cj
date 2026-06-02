// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan-2 true

open class A {}

class B <: A {}

struct C {}

func foo1() {
    let a: A = B()
    let v: Any = a
    println(v is B)
}

func foo2() {
    let a: C = C()
    let v: Any = a
    println(v is C)
}

main(): Int64 {
    foo1()
    foo2()
    return 0
}