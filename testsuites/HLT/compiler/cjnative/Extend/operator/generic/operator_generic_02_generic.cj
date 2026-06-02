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
    return 1
}

class A<T> {}

interface I<T> {}

extend<T> A<T> <: I<T> {
    public operator func +<T>(right: Int64): UInt8 {
        return 0
    }
}
// ASSERT: scan sema_generic_in_operator_overload
