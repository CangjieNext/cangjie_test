/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    1
}

interface I<T> {
    operator func ==(right: T): T
}

class A<T> {}

extend<T> A<T> <: I<Int32> {
    public operator func ==(right: T): T {
        right
    }
}
// ASSERT: scan sema_need_member_implementation
