// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan operator func () of class A
// ASSERT: scan operator func () of class A, input: 1
class A {
    operator func ()() {
        print("operator func () of class A\n")
    }

    operator func ()(x: Int32) {
        print("operator func () of class A, input: ${x}\n")
    }
}

func run() {
    var a = A()
    a()
    var x: Int32 = 1
    a(x)
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
