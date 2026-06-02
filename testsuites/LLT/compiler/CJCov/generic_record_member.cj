// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan operator func () of generic struct A
// ASSERT: scan operator func () of generic struct A
struct A<T> {
    operator func ()(x: T) {
        print("operator func () of generic struct A\n")
    }
}

func run() {
    var a1 = A<Int32>()
    a1(1)
    var a2 = A<Float32>()
    a2(1.0)
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
