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
    let ui8: Int8 = 1
    let ui16: Int16 = 20
    let ui32: Int32 = 30
    let ui64: Int64 = 400
    println(ui8)
    println(ui16)
    println(ui32)
    println(ui64)
    print(ui8, flush: true)
    print(ui16, flush: false)
    print(ui32, flush: false)
    print(ui64, flush: false)
}
