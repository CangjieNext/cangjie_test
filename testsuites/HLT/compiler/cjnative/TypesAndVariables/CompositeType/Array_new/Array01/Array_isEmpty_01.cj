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

var a = Array<Int8>()
var a1 = Array<Int16>()
var a2 = Array<Int32>()
var a3 = Array<Int64>()
var a4 = Array<UInt8>()
var a5 = Array<UInt16>()
var a6 = Array<UInt32>()
var a7 = Array<UInt64>()
var a8 = Array<Float16>()
var a9 = Array<Float32>()
var a10 = Array<Float64>()
var a11 = Array<Rune>()
var a12 = Array<Bool>()
var a13 = Array<String>()

main(): Int64 {
    if (a.isEmpty() && a1.isEmpty() && a2.isEmpty() && a3.isEmpty() && a4.isEmpty() && a5.isEmpty() && a6.isEmpty() &&
        a7.isEmpty() && a8.isEmpty() && a9.isEmpty() && a10.isEmpty() && a11.isEmpty() && a12.isEmpty() && a13.isEmpty()) {
        return 0
    }
    return 1
}
