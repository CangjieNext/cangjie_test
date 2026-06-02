/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var i: Int32 = 91
    var result = match (i) {
        case 90 | other => other.toString()
    }
    if (result == "91") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_var_in_or_pattern
// ASSERT: scan sema_undeclared_identifier
