// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

// enum `this` call
enum A {
    C | D(Int64)

    func f() {
        return 1
    }
    func foo() {
        return this.f()
    }
}

main() {
    return A.D(1).foo()
}
