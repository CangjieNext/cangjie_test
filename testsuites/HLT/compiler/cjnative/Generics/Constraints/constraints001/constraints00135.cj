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

interface I {
    operator func ()(x: Int) {
        x - 1
    }
}

class A {}

extend A <: I {}

class Test<T> where T <: I {
    func test(f: T) {
        return f(1)
    }
}

main(): Int64 {
    return Test<I>().test(A())
}
