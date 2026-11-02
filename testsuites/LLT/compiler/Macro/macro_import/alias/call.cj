// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p.cj m.cj
// EXEC: %compiler --output-type=staticlib p.cj
// EXEC: %compiler %cmp_macro m.cj --import-path .
// EXEC: %run_macro %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libp.a" -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 42

// E2E for the alias form 'macro import p as q' (UT-D-04): the alias is a
// package-local name of the macro package, and the injected import must be
// the bare `import p`. The downstream uses p.hello without importing p; if
// the alias were not stripped (`import q` injected), this case fails to
// compile because no package q exists.

import m.*

@Dummy
func f(): Int64 {
    return hello()
}

main() {
    println(f())
}
