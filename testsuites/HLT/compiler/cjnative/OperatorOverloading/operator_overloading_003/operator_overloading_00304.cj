/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct R {
    public operator func +(b: R, c: R): Int32 {
        return 1
    }
    public operator func -(b: Int32, c: Int32): Int32 {
        return 1
    }
    public operator func !(b: R, c: R): Int32 {
        return 1
    }
    public operator func !(b: Int32, c: Int32): Int32 {
        return 1
    }
}

class C {
    public operator func +(b: Int32, c: Int32): Int32 {
        return 1
    }
    public operator func -(b: C, c: C): Int32 {
        return 1
    }
    public operator func !(b: Int32, c: Int32): Int32 {
        return 1
    }
    public operator func !(b: C, c: C): Int32 {
        return 1
    }
}

interface I {
    operator func +(b: Int32, c: Int32): Int32 {
        return 1
    }
    operator func -(b: I, c: I): Int32 {
        return 1
    }
    operator func !(b: Int32, c: Int32): Int32 {
        return 1
    }
    operator func !(b: I, c: I): Int32 {
        return 1
    }
}

class A <: I {}

main(): Int64 {
    var a: I = A()
    var c = C()
    return 1
}
// ASSERT: scan sema_operator_overload_invalid_num_parameter
