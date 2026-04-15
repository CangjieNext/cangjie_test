// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_illegal_member_used_in_open_constructor
// ASSERT: scan the error originates in the macro `Initfoo` (consider using `--debug-macro` for more info)


import define.*

interface I {
    func coo() {}
}

open class A <: I {
    protected func foo() {}
}

open class B <: A {
    @Initfoo
    public init() {
    }
}

main(): Int64 {
    0
}
