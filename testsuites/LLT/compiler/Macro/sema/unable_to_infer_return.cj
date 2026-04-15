// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_unable_to_infer_return_type
// ASSERT: scan the error originates in the macro `FooGeneric` (consider using `--debug-macro` for more info)

import define.*

@FooGeneric
func foo<T>(a: T) {
    bar<Int64>(1)
    a
}

func bar<T>(a: T) {
    baz(foo<Int64>(1)) // Use unknown as function call
    a
}

func baz<T>(a: T): T {
    a
}

main() {}
