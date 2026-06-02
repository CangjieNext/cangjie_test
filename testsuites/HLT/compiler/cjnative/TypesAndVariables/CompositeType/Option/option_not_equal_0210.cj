/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    let a: Option<A> = A(100)
    let a1: ?A = A(900)
    let b: ?A = None
    if (!(a != a1)) {
        return 1
    }
    if (!(b != a)) {
        return 2
    }
    return 0
}

class A <: Equatable<A> {
    public A(let a: Int64) {}
    public operator func ==(b: A) {
        return this.a == b.a
    }
    public operator func !=(b: A) {
        return !(this == b)
    }
}
