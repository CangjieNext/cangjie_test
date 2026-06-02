/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan-begin 1
// ASSERT: scan-next 20
// ASSERT: scan-next 30
// ASSERT: scan-next 400
// ASSERT: scan-next 12030400
// ASSERT: scan-end
import std.collection.*
import std.math.*

main() {
    let i8: Int8 = 1
    let i16: Int16 = 20
    let i32: Int32 = 30
    let i64: Int64 = 400
    println(i8)
    println(i16)
    println(i32)
    println(i64)
    print(i8, flush: true)
    print(i16, flush: false)
    print(i32, flush: false)
    print(i64, flush: false)
}
