/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix

class A <: Equatable<A> {
    public A(let a: Int64) {}
    public operator func ==(b: A) {
        return this.a == b.a
    }
    public operator func !=(b: A) {
        return !(this == b)
    }
}

main(): Int64 {
    if (Some(A(20)) == Some(A(20))
        && Option<A>.None == Option<A>.None
        && Some(A(20)) != Some(A(10))
        && Some(A(20)) != Option<A>.None
        && Option<A>.None != Some(A(10))) {
        return 0
    }
    return -1
}
