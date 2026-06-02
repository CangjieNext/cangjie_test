/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface C {
    func f(): Int64
}
// should failed, not supported
enum A<T> <: C {
    a(T)
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_need_member_implementation
