/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

// 索引操作符溢出
main(): Int64 {
    //    var s1 = "仓颉"[..3]
    //    var s2 = "cangjie"[-1..]
    //    var s3 = "仓颉"[-1..0]
    var s4 = "仓颉"[6..9]
    return 0
}
