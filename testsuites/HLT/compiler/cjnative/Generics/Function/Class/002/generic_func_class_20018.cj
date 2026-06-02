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

class A<X> {
    public func test(x: X): X {
        println("a");
        x
    }
    public func test<T>(x: (Int64, T)): Int64 {
        println("b");
        0
    }
}

main() {
    A<(Int64, Int64)>().test((1, 1))
    0
}
