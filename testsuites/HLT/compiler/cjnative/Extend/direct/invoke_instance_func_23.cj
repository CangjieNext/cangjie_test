/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A {
    A(var a!: Int64 = 5) {
    }
}

extend A {
    public func me() {
        return 0
    }

    public func me(a: Int32) {
        return a
    }

    public func me(a: Int32, b: Int32) {
        return a + b
    }
}

main(): Int64 {
    let a = A()
    return a.me() + Int64(a.me(1) + a.me(0, -1))
}
