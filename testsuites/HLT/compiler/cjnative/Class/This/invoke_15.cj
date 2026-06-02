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
    var a = Data(a: 8).f2()
    if (a is Data && aa == 1 && a.a == 8) {
        return 0
    }
    return 1
}

class Data {
    public Data(var a!: Int64 = 6) {
        aa++
    }

    public func f2(): Data {
        return f2(2)
    }

    public func f2(a: Int64): This {
        return this
    }
}
