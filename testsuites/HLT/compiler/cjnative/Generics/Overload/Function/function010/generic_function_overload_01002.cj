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

class A<T> {
    public func f(a: Int64): Int64 {
        0
    } //f1
    public func f(a: T): Int64 {
        1
    } //f2
    public func test() {
        f(1)
    }
}

main() {
    A<Int32>().test() // f1
}
