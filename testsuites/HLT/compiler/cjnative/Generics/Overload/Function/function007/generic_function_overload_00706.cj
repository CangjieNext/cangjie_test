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
func test<T>(a: T): Int8 {
    1
}

func test<T>(a: T, b!: Int8 = 1): Int16 {
    2
}

main(): Int64 {
    func test(a: Int64): Int32 {
        3
    }
    var I: Int8 = test(1)
    if (I != 1) {
        return 1
    }
    return 0
}
