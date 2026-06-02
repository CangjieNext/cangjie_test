// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj %diag_json -o %output

interface I<P> {
    static func foo(a: Int32): Int32 {
        a*2
    }
}

class A<X, Y> {
}

extend A<Int64,Int32> <: I<Int32>{
}

extend<M, N> A<M, N> {
    static public func foo(a: Int32): Int32 {
        a
    }
}

main() {
    A<Int64, Int32>.foo(1) - 1 + A<Unit, Unit>.foo(Int32(2)) - 2
}
// ASSERT: scan sema_extend_member_cannot_shadow
