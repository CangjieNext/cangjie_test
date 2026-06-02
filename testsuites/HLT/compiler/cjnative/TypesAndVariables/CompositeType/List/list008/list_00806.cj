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
    static func test(input: T) {
        var a: Array<T> = [input]
        return a.size - 1
    }
}

class Test<T> <: A<T> {}

main(): Int64 {
    return Test<Int64>.test(1)
}
