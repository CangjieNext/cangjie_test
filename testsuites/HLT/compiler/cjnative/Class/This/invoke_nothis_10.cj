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

class Data {
    public Data(var a!: Int64 = 6) {
        aa++
    }

    public func f2() {
        this
    }

    public func f1(i: Int64): This {
        f2()
    }
}

var data = Data(a: 8)
var b = {
    => data.f1(3)
}()

main(): Int64 {
    if (data.a == 8 && aa == 1) {
        return 0
    }
    return 1
}
