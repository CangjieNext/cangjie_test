// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

// enum member func
enum A {
    C | D(Int64)

    func foo() {
        return 1
    }
}

main() {
    // `this` obj is constructed by enum member access
    return A.C.foo()
}
