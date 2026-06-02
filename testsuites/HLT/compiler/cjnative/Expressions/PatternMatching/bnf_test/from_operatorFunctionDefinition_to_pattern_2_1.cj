/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend Int32 {
    public operator func +(a!: Int64 = match (1) {
            case _ => 1
        }): Int32 {
        match (a) {
            case x: Int32 => 1
            case _ => 0
        }
        this + a
    }
}

func run(): Int64 {
    let x: Int32 = Int32(2) + if (x == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_have_default_param
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_undeclared_identifier
