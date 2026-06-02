// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_param_named_mismatched
// ASSERT: scan the error originates in the macro `ParamName` (consider using `--debug-macro` for more info)

import define.*

interface I {
    static func f(a!: Int32): Int32 {
        a
    }
}

class A <: I {
    @ParamName
    func f(a: Int32): Int32 {
        a + 2
    }
}

main() {
    A.f(0)
}
