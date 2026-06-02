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

interface A {
    func f(): Int64
}

struct B {}

extend B <: A {
    public func f(): Int64 {
        return 1
    }
}

func test_f(a: A): Int64 {
    var value: A = a
    return value.f()
}

main() {
    var temp: A = B()
    var a = test_f(temp)
    return a - 1
}
