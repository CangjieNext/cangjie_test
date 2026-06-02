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

type float1 = Float64

type float2 = Float32

type float3 = Float16

type int1 = Int64

type int2 = Int32

type int3 = Int16

type int4 = Int8

type uint1 = UInt64

type uint2 = UInt32

type uint3 = UInt16

type uint4 = UInt8

main(): Int64 {
    var f1: float1 = 3.1415926
    let f2: float2 = 3.1415926
    var f3: float3 = 3.1415926
    var i1: int1 = -64
    let i2: int2 = 32
    var i3: int3 = -16
    let i4: int4 = 8
    let u1: uint1 = 64
    var u2: uint2 = 32
    let u3: uint3 = 16
    var u4: uint4 = 8
    if (f1 != 3.1415926 && f2 != 3.1415926 && f3 != 3.1415926) {
        return 1
    }
    if (i1 != -64 && i2 != 32 && i3 != -16 && i4 != 8) {
        return 1
    }
    if (u1 != 64 && u2 != 32 && u3 != 16 && u4 != 8) {
        return 1
    }
    return 0
}
