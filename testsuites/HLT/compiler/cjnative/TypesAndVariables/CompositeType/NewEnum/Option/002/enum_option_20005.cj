/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A {
    CN(?Int64)
}

main(): Int64 {
    var x = 1
    var res = match (x) {
        case x: A => x
        case _ => A.CN(Some<Int64>(0))
    }
    match (res) {
        case b(v) => v - 1
        case _ => 1
    }
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_undeclared_identifier
