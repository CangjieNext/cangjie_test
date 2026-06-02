/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {
    @Frozen
    func test1() {
        return 0
    }

    @Frozen
    static func test2<M>() {
        return 0
    }
}

class A<T> <: I<T> {}

main() {
    return A<Int64>().test1() + I<Int64>.test2<Int64>()
}
