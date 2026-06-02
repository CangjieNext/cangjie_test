// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan operator func () in enum, get 1.000000
// ASSERT: scan 1.000000
// ASSERT: scan operator func () in enum, get 1, 1
// ASSERT: scan 1

enum E {
    X | X(Float64) | X(Int64, Int64)

    public operator func ()(a: Float64) {
        print("operator func () in enum, get ${a}\n")
        a
    }

    public operator func ()(a: Int64, b: Int64) {
        print("operator func () in enum, get ${a}, ${b}\n")
        a
    }
}

main() {
    let e1: E = X(1.0)
    let res1 = e1(1.0)
    print("${res1}\n")
    let e2: E = X(1, 1)
    let res2 = e2(1, 1)
    print("${res2}\n")
    0
}
