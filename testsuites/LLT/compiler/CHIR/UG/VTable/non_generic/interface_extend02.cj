// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj %diag_json -o %output

interface III1 {
    func foo(): Int64 {
        1
    }
}

interface III2 {
    func foo(): Int64
}

struct AAA {
}

extend AAA <: III1 {}

extend AAA <: III2 {}

extend AAA {
    public func foo(): Int64 {
        2
    }
}

main() {
    var x: III1 = AAA()
    return x.foo() - 2
}
// ASSERT: scan sema_extend_member_cannot_shadow
