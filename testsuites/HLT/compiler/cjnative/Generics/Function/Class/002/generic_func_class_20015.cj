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

open class A {
    public func test<T1, T2>(x: T1, y: T2): T1 {
        println("a");
        x
    }
}

class B <: A {
    public func test<T>(x: T, y: T): T {
        println("b");
        x
    }
}

main() {
}
