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

struct A {
    func test(a: Int64) {
        return a
    }
}

extend A {
    func test(a: Int64, b: Int64) {
        return a + b
    }
    func f1() {
        test(1)
    }
    func f2() {
        test(1, 2)
    }
}

main() {
    var a: A = A()
    if (a.f1() != 1) {
        return 1
    }
    if (a.f2() != 3) {
        return 2
    }
    return 0
}
