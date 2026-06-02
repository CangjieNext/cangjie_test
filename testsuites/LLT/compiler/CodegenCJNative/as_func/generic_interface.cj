// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan operator func () in generic struct 'A' with generic Callable Interface
// ASSERT: scan operator func () in generic struct 'A' with generic Callable Interface
interface Callable<T> {
    operator func ()(x: T): Unit
}

struct A<T> <: Callable<T> {
    public operator func ()(x: T): Unit {
        print("operator func () in generic struct 'A' with generic Callable Interface\n")
    }
}

func run() {
    var a1 = A<Float32>()
    let x1: Float32 = 1.0
    a1(x1)

    var a2 = A<Int32>()
    let x2: Int32 = 1
    a2(x2)
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
