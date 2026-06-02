// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: decl_macro.cj
// EXEC: %compiler %cmp_macro decl_macro.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan non-exhaustive patterns

import decl_macro.*

@MyDecl
sealed interface I {}

@MyDecl
class A <: I {}

@MyDecl
class B <: I {}

func f(x: I) {
    match (x) {
        case _: A => 0
        case _: B => 1
    }
}

main() {
    f(A())
}
