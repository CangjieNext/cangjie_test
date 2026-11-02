// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f --import-path . -L . --link-options "-l:libp1.a -l:libp2.a" -o %output
// ASSERT: scan ambiguous match for function call 'fval'

// DEPENDENCE: p1.cj p2.cj m1.cj m2.cj

// E2E for use-site conflict (M5/E2E-05): two macro packages inject imports of
// packages declaring the same symbol. The declarations compile fine (m1
// expands inside f() and p1.fval wins there); the conflict surfaces at the
// use site — when @Dummy2 is expanded on the same function, both `import p1`
// and `import p2` are in scope and fval() becomes ambiguous.

import m1.*
import m2.*

@Dummy1
@Dummy2
func f(): Int64 {
    return fval()
}

main() {
    println(f())
}
