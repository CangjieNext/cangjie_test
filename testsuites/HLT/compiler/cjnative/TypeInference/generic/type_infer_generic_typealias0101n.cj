/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type B<T> = Cl<T>

func run(): Int64 {
    var a: B<T>
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_undeclared_type_name
