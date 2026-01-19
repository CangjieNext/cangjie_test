// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

const v1 = 0 as Int32
const v2 = 0i32 as Int32
const v3 = 0 as Int64
const v4 = 0i64 as Int64
const v5 = 0 as Int8
const v6 = 0i8 as Int8

main() {
    println(v1)
    println(v2)
    println(v3)
    println(v4)
    println(v5)
    println(v6)
}

/* SCAN
None
Some(0)
Some(0)
Some(0)
None
Some(0)
*/
