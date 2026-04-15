// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_ambiguous_use
// ASSERT: scan the error originates in the macro `Testfoo` (consider using `--debug-macro` for more info)

import define.*

interface Data2 {
    func foo(a: Int64): Int64 {
        return 2
    }
}

open class Test1 <: Data2 {
    public func foo(): Int64 {
        return 3
    }
}

class Test <: Test1 & Data2 {}

main(): Int64 {
    var a = @Testfoo(Test()) // Test().foo
    return 0
}
