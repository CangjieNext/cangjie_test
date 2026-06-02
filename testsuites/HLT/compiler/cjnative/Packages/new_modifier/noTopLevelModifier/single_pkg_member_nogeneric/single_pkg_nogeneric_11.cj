/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal enum test {
    RR

    public func test1(a: Int64): Int64 {
        return a
    }
}

internal var testr = test.RR
public var temp_test = testr.test1(1)

main() {
    return temp_test - 1
}
