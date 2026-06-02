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

let a1: Range<Int8> = 0..10 : 5
let a2: Range<UInt8> = 0..10 : 5
let a3: Range<Int16> = 0..10 : 5
let a4: Range<UInt16> = 0..10 : 5
let a5: Range<Int32> = 0..10 : 5
let a6: Range<UInt32> = 0..10 : 5
let a7: Range<Int64> = 0..10 : 5
let a8: Range<UInt64> = 0..10 : 5

/*
let a9: Range<Float16> = 0..10:5
let a10: Range<Float32> = 0..10:5
let a11: Range<Float64> = 0..10:5*/
main(): Int64 {
    return 0
}
