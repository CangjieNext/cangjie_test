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
    if (foo(1) != 1) {
        return 1
    }
    return 0
}

func foo(x: Int32) {
    return x
}

let foo: (Int32) -> Int32 = {x: Int32 => x * 2}
// ASSERT: scan sema_redefinition
