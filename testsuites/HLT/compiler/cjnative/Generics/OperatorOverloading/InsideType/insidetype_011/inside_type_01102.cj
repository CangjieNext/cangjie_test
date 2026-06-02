/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A<X, Y> {
    public operator func *(b: A<X, Y>): Bool {
        true
    }
    public operator func *(b: A<X, Y>): Bool {
        true
    }
    public operator func *(b: A<X, Y>): Bool {
        true
    }
}

struct B<X, Y> {
    public operator func *(b: B<X, Y>): Bool {
        true
    }
    public operator func *(b: B<X, Y>): Bool {
        true
    }
    public operator func *(b: B<X, Y>): Bool {
        true
    }
}

interface C<X, Y> {
    operator func *(b: C<X, Y>): Bool {
        true
    }
    operator func *(b: C<X, Y>): Bool {
        true
    }
    operator func *(b: C<X, Y>): Bool {
        true
    }
}

class D <: C<Int8, Int8> {}

main(): Int64 {
    var a: A<Int8, Int8> = A<Int8, Int8>()
    var b: B<Int8, Int8> = B<Int8, Int8>()
    return 0
}
// ASSERT: scan sema_overload_conflicts
