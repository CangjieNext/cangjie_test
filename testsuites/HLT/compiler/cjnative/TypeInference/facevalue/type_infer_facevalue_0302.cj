/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo_tuple(): Int64 {
    var tp1: (Float32, String) = (3.14, "PIE")
    var tp2: (String, String) = ("3.14", "PIE")
    var res1 = if (true) {
        tp1
    } else {
        ("3.14", "PIE")
    }
    var res2 = if (false) {
        (3.14, "PIE")
    } else {
        tp2
    }
    if (tp1[0] == 3.14 && tp2[0] == "3.14") {
        return 0
    }
    return 1
}

main(): Int64 {
    return foo_tuple()
}
// ASSERT: scan chir_dce_unused_variable
