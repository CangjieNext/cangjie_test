// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_interface_call_with_unimplemented_call
// ASSERT: scan the error originates in the macro `Atest` (consider using `--debug-macro` for more info)

import define.*

interface I {
    static func test(): Unit
}

abstract class A <: I {}

main(): Int64 {
    @Atest(A)
    return 0
}
