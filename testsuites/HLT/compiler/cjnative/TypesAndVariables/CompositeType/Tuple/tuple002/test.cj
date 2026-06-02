/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Int8 = 1
    var b: Int16 = 1
    var c: Int32 = 1
    var d: Int64 = 1
    var e: UInt8 = 1
    var f: UInt16 = 1
    var g: UInt32 = 1
    var h: UInt64 = 1
    var i: Float32 = 1.0
    var j: Float64 = 1.0
    var MyTuple = ((a, b), (c, (d, (e, (f, g), h), i), j))
    return 0
}
