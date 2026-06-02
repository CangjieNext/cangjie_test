/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {}

interface update {
    operator func !(a: update): update
}

extend A <: update {
    public operator func !(a: A): A {
        return A()
    }
}

extend Int32 <: update {
    public operator func !(a: Int32): Int32 {
        return 1
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
// ASSERT: scan sema_need_member_implementation
