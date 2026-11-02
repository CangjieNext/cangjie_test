// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p.cj m.cj side.cj
// ERRCHECK: %compiler %cmp_opt %f side.cj --import-path . -L . --link-options "-l:libp.a" -o %output
// ASSERT: scan undeclared identifier 'hello'

// E2E for file-level private scope of the macro import injection (M2/E2E-04):
// the injected `import p` only lands in files that reference the macro
// package. main.cj imports m and expands @Dummy, so hello() is visible there;
// side.cj lives in the same package but does NOT import m — its fb() must not
// see the injected symbol, and the compilation fails with "undeclared
// identifier 'hello'" pointing at side.cj. Note the error is NOT reported for
// main.cj, which proves the injection is file-scoped, not package-scoped.

package scope_test

import m.*

@Dummy
func fa(): Int64 {
    return hello()
}

main() {
    println(fa())
}
