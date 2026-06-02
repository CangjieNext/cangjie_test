/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(): Int64 {
    var res1 = if (true) {
        "hi"
    } else {
        'b'
    }
    var res2 = if (false) {
        'a'
    } else {
        3
    }
    return 0
}

main(): Int64 {
    return foo()
}
// ASSERT: scan sema_diag_report_error_message
