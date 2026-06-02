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

main() {
    var a = 0
    try {
        func test<T>(a: T) {
            a
        }
        a += test<Int64>(1)
    } catch (_: Exception) {
        return 1
    } finally {
        func test<T>(a: T) {
            a
        }
        a += test<Int64>(1)
    }
    return a - 2
}
