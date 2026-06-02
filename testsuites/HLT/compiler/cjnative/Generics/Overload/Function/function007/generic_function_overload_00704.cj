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
class X<T> {
    public static func test<T>(a: T, b: Int8): Int64 {
        1
    }
    public static func test<T>(a: T, b: Int16): Int32 {
        2
    }
}

main(): Int64 {
    var I: Int64 = X<Int32>.test(1, 1)
    if (I != 1) {
        return 1
    }
    return 0
}
