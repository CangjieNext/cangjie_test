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

var aa = 0

main(): Int64 {
    var b = C().f2(2)
    if (b is C && aa == 1 && b.a == 6) {
        return 0
    }
    return 1
}

open class Data {
    public Data(var a!: Int64 = 6) {
        aa++
    }

    public open func f2(a: Int64): This {
        aa = aa + 5
        return this
    }
}

class C <: Data {
    public override func f2(a: Int64): This {
        return this
    }
}
