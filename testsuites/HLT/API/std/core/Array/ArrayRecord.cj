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

struct Rcd {
    public var a0: Int64 = 0
    public var a1: Int32 = 2
    public var f0: Float32 = 3.150000
    public var f1: Float64 = 3.160000
}

main(): Int64 {
    var array4 = [Rcd()]
    var arr = array4[0]
    var f = arr.f0
    if (f == 3.150000) {
        return 0
    }
    return 1
}
