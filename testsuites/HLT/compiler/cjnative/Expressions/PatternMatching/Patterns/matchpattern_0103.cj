/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() == 0) {
        return 0
    }
    return 1
}

func case01() {
    var result: Int64 = match (()) {
        case () => 0
        case a => 1
        case _ => 10
    }
    return result
}
// ASSERT: scan sema_unreachable_pattern
