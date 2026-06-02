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

enum A<T> {
    a(T)

    public func test(x: A<T>): A<T> {
        x
    }
}

main(): Int64 {
    var i = A<Int64>.a(1)
    var x: A<Int64> = i.test(i)
    return 0
}
