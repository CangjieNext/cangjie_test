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

// * 后为表达式
main(): Int64 {
    var s1 = "仓颉" * (2 * 2 + 1)
    if (s1 == "仓颉" * 5) {
        return 0
    }
    return 1
}
