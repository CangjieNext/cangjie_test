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
    let scoreTuple = (1, 1)
    var result: String = match (scoreTuple) {
        case (x, x) => "Yes"
        case (_, _) => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_redefinition
