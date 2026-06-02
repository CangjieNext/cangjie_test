/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %run_args 2>&1 | compare %f
// RUN-EXEC-PIPE-0: %run %run_opt %output
// ASSERT: scan function 'GetPI' is deprecated. Use `public func getPI()` instead.
// ASSERT: scan function 'GetE' is deprecated. Use `public func getE()` instead.
// ASSERT: scan function 'GetPI' is deprecated. Use `public func getPI()` instead.
// ASSERT: scan function 'GetE' is deprecated. Use `public func getE()` instead.
// ASSERT: scan function 'GetPI' is deprecated. Use `public func getPI()` instead.
// ASSERT: scan function 'GetE' is deprecated. Use `public func getE()` instead.

import std.overflow.*
import std.math.*

main(): Unit {
    Float16.GetPI()
    Float16.GetE()
    Float32.GetPI()
    Float32.GetE()
    Float64.GetPI()
    Float64.GetE()
}
