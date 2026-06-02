// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_not_found_from_generic_upper_bounds
// ASSERT: scan the error originates in the macro `M0` (consider using `--debug-macro` for more info)

import define.*

open class C {
    public func foo(a: Int32) {
        return a
    }
}

interface I<T> {
    func foo(a: T) {
        return a
    }
}

func Foo<U>(a: U) where U <: C & I<U> {
    @M0 var d = a.bar()
}

main() {}
