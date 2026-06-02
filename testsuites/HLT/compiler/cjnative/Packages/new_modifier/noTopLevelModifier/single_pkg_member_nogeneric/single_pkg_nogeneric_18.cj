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

public class test {
    internal func test1(a: Int64): Int64 {
        return a
    }
    var f1 = {a: Int64, b: Int64 => a + b}
}

public var test1 = test()

main() {
    var res = test().f1(1, 2)
    return test1.test1(1) + res - 4
}
