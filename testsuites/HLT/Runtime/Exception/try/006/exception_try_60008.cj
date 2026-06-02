/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex Exception
// (not O2) ASSERT: regex exception_try_60008.cj:18
class A <: Exception {}

main() {
    var a = try {
        A().printStackTrace()
    } finally {}
    while (false) {
        A().printStackTrace()
    }
    return 0
}
