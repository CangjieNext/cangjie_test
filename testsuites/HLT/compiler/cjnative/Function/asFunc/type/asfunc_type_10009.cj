/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A<T> {
    operator func ()(input: T): Int64
}

class B<T> <: A<T> {
    public operator func ()(input: T) {
        0
    }
    public func test(input: T) {
        var b: B<T> = B<T>()
        b(input)
    }
}

main() {
    var b: B<Int64> = B<Int64>()
    return b.test(1)
}
