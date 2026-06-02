/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

func foo1(x!: Int8 = 1.0): Int8 {
    return x
}

func foo2(x!: Int64 = 2.0): Int64 {
    return x
}

main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    return 0
}
// ASSERT: scan sema_cannot_convert_literal
