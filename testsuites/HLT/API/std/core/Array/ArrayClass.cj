/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 1
    public var t1: Int64 = 10
    public var f0: Float16 = 3.14
    public var f1: Float64 = 3.150000
}

main(): Int64 {
    var array3 = [Test()]
    if (array3[0].f1 == 3.150000) {
        return 0
    }
    return 1
}
