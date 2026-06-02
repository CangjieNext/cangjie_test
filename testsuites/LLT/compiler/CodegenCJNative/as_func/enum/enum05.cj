// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan operator func () in enum, get 1
// ASSERT: scan 1
// ASSERT: scan operator func () in enum, get 1
// ASSERT: scan 1
// ASSERT: scan operator func () in enum, get 1.000000
// ASSERT: scan 1.000000
// ASSERT: scan operator func () in enum, get 1
// ASSERT: scan 1

enum E {
    Y | X | X(Int64)

    public operator func ()(a: Int64) {
        print("operator func () in enum, get ${a}\n")
        a
    }
    public operator func ()(a: Float64) {
        print("operator func () in enum, get ${a}\n")
        a
    }
}

main() {
    let e = X(1) // ok, X(1) is to call the constructor X(Int64).
    let res = e(1)
    print("${res}\n")
    let e1 = X
    let res1 = e1(1) // ok, e1(1) is to call the operator () overloading function.
    print("${res1}\n")
    let res2 = X(1.0) // ok, X(1.0) is to call the operator () overloading function.
    print("${res2}\n")
    let res3 = Y(1) // oK, Y(1) is to call the operator () overloading function.
    print("${res3}")
    0
}
