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

interface I1 {
    static func test1(): Int64
    static func test2(): Int64 {
        test1()
    }
}

interface I2 <: I1 {
    static func test1(): Int64 {
        return 0
    }
}

main(): Int64 {
    return I2.test2()
}
