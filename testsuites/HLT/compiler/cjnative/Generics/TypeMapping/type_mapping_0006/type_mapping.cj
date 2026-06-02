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

interface I<T> {
    func test(a: T): Int64 {
        return 0
    }
}

extend<T> Range<T> <: I<Range<T>> & I<Int64> {}

main() {
    var a = 0..10 : 1
    return a.test(a) + a.test(1)
}
