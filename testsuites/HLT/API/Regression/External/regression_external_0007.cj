/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 22

main(): Int64 {
    let foo = max(1i32, 2i32)
    let bar = max(1i64, 2i64)

    let xx = max(1i32, 2i32)
    let yy = max(1i64, 2i64)
    let zz = max(Int64(1), Int64(2))
    print(yy)
    print(zz)
    0
}
