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
    static func test(x: T): T {
        x
    }
}

func test(x: (Int64) -> Int64) {
    x(1)
}

main() {
    var a = A<Int64>.test
    if (a(1) == 1 && test(A<Int64>.test) == 1) {
        return 0
    }
    return 1
}
