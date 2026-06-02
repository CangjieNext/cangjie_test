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

struct A<T> {
    @Frozen
    func test1<M>() {
        return 0
    }

    @Frozen
    static func test2<M>() {
        return 0
    }
}

main() {
    return A<Int64>().test1<Int64>() + A<Int64>.test2<Int64>()
}
