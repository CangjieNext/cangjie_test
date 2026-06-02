/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func run(): Int64 {
    var array1: Array<String> = [r'a', r'b', r'c', r'd']
    array1[0] = 2
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_cannot_assign_to_subscript
