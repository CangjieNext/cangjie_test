/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A {}

extend A {
    @OverflowSaturating
    public operator func +(x: Float64): Int8 {
        var x1: Int8 = 100
        var y: Int8 = 100
        return x1 + y
    }
}

main() {
    var res = Int64((A() + 1.0) - 127)
    print("success")
    return res
}
