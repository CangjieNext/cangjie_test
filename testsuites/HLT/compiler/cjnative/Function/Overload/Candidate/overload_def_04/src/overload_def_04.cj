/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// ERRCHECK: %compiler %cmp_opt src/a.cj src/%f -o %output

main(): Int64 {
    let a = foo(1)
    if (a != 1) {
        return 1
    }
    return 0
}

func foo(x: Int64) {
    return 1
}
// ASSERT: scan sema_ambiguous_match
// ASSERT: scan sema_overload_conflicts
