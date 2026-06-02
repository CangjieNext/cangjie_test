// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_generic_func_without_type_arg
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)

import define.*

class A {
    func test<T>() {
        1
    }
    private func test(a: Int64) {
        2
    }
}

main() {
    let a = A()
    @M1 let b = a.test
    return 0
}
