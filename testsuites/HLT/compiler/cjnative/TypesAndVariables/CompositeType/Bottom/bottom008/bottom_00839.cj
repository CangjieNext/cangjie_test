/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var a: Array<Array<Int64>> = [[1, 2]]

// func test():Int64 = a[return 0][return 1]

func test(): Int64 {
    a[return 0][return 1]
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_invalid_subscript_expr
