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

open class A<T> {
    protected operator func ()(input: T) {}
}

class B<T> <: A<T> {
    public func test(input: T) {
        var b: B<T> = B<T>()
        b(input)
    }
}

main() {
    var b: B<Int64> = B<Int64>()
    b.test(1)
    return 0
}
