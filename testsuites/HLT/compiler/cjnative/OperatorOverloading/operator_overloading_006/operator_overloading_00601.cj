/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {}

interface update {
    operator func !(): update
}

extend A <: update {
    public operator func !(): A {
        return A()
    }
}

extend Int32 <: update {
    public operator func !(): Int32 {
        return 1
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_operator_overload_built_in_unary_operator
