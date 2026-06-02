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

main(): Int64 {
    let a = UInt64(1)..UInt64(10) : 1
    let b = UInt64(1)..10 : 1
    let c = 1..UInt64(10) : 1
    let d = 1..10 : 1
    var e: UInt64 = 1
    let e1 = e..e : 1
    let e2 = e..1 : 1
    let e3 = 1..e : 1
    let e4 = 1..1 : 1
    return 0
}
