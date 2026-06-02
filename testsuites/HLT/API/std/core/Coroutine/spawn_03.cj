/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan success

main(): Int64 {
    let num = 1
    let fut = spawn {
        return num + 10
    }
    var result = -2
    try {
        result = fut.get()
    } catch (e: Exception) {
        result = -1
    }
    if (result == 11) {
        print("success")
    }
    return 0
}
