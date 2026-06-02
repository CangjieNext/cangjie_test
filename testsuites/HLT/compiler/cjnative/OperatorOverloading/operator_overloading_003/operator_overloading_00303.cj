/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct R {
    public operator func !(b: R): Int32 {
        return 1
    }
    public operator func !(b: R): Int32 {
        return 1
    }
}

class C {
    public operator func !(b: R): Int32 {
        return 1
    }
    public operator func !(b: R): Int32 {
        return 1
    }
}

interface I {
    operator func !(b: R): Int32 {
        return 1
    }
    operator func !(b: R): Int32 {
        return 1
    }
}

class A <: I {}

main(): Int64 {
    var a: I = A()
    var c = C()
    var r = R()
    return 1
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
// ASSERT: scan sema_overload_conflicts
