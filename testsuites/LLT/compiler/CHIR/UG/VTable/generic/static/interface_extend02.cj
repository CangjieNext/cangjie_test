// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj %diag_json -o %output

interface III1<T> {
    static func foo(a: (Int32, T)): Int64 {
        1
    }
}

interface III2<T> {
    static func foo(a: (T, Unit)): Int64 {
        2
    }
}

struct AAA {
}

extend AAA <: III1<Unit> {}

extend AAA <: III2<Int32> {}

extend AAA {
    static public func foo(a: (Int32, Unit)): Int64 {
        3
    }
}

main() {
    var x: (Int32, Unit) = (1, ())
    return AAA.foo(x) - 3
}
// ASSERT: scan sema_extend_member_cannot_shadow
