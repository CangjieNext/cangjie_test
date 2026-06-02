/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler %cmp_opt %f src/pkgs/pkgs.cj -o %output 2>&1 | compare %f

package pkgs

enum TimeUnit1<T> {
    Hour(T)
}

func run(): Int64 {
    var time1 = TimeUnit1.Hour(3)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_redefinition
