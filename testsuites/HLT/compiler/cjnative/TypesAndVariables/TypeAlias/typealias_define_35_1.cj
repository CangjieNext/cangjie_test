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

type numtype<T> = T

main(): Int64 {
    var f1: numtype<Float64> = 3.1415926
    var i1: numtype<Int64> = 4
    let i2: numtype<Int32> = -8
    let i3: numtype<Int8> = 16
    let i4: numtype<UInt16> = 32
    if (f1 == 3.1415926 && i1 == 4 && i2 == -8 && i3 == 16 && i4 == 32) {
        return 0
    }
    return 1
}
