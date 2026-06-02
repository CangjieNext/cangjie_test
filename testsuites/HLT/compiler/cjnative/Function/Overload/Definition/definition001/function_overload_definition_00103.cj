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
func test(a: Int16, b: Int16): Int64 {
    return 1
}

func test(a: Int8, b: Int8): Int64 {
    return 2
}

main(): Int64 {
    func test2(a: Int16, b: Int16): Int64 {
        return 3
    }
    func test2(a: Int8, b: Int8): Int64 {
        return 4
    }
    return test(Int16(1), Int16(1))
        + test(Int8(1), Int8(1))
        + test2(Int16(1), Int16(1))
        + test2(Int8(1), Int8(1)) - 10
}
