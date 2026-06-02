/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var i: Int32 = 0
    match (i) {
        case _ | _ => "0"
    }
    return 0
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan chir_dce_unused_expression
