// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I0<T> {
    func f() {}
}

interface I1<T> <: I0<T> {}

class C<A> {}

extend<A> C<A> <: I1<Option<A>> {}
extend<A> C<A> <: I0<Option<A>> {}

main(): Int64 {
    let c = C<Int64>()
    c.f()
    return 0
}
