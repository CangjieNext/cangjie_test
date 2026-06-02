/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

func foo1(): Int8 {
    return 2.0
}

func foo2(): Int64 {
    return 2.2
}

main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    return 0
}
// ASSERT: scan sema_cannot_convert_literal
