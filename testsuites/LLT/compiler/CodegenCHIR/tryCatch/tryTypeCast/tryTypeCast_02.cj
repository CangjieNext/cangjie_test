// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 200
// ASSERT: scan 300

main() {
    var a: Float16 = 0.0 / 0.0
    try {
        println(Int8(a))
    } catch (e: Exception) {
        println(200)
    } finally {
        println(300)
    }
    return 0
}
